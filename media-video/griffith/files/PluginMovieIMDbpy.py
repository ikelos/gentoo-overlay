# -*- coding: UTF-8 -*-

__revision__ = '$Id$'

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Library General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA

# You may use and distribute this software under the terms of the
# GNU General Public License, version 2 or later

import gtk
import imdb

import movie

plugin_name = 'IMDb(IMDbpy)'
plugin_description = 'Internet Movie Database'
plugin_url = 'www.imdb.com'
plugin_language = _('English')
plugin_author = 'Mike Auty'
plugin_author_email = 'mike.auty@gmail.com'
plugin_version = '1.0'


class Plugin(movie.Movie):
    def __init__(self, movie_id):
        self.encode = 'utf-8'
        self.movie_id = movie_id
        self.url = "http://imdb.com/title/tt%s" % self.movie_id
        self.ia = imdb.IMDb()
        self.parent_window = None

    def open_page(self, parent_window = None, url = None):
        if parent_window is not None:
            self.parent_window = parent_window
        self.progress.set_data(parent_window, _("Fetching data"), _("Wait a moment"), False)
        self.progress.pulse()
        gtk.main_iteration()
        self.movie = self.ia.get_movie(self.movie_id)
        return True

    def initialize(self):
        self.movie = self.ia.get_movie(self.movie_id)

    def get_image(self):
        self.image_url = self.movie.get('full-size cover url')

    def get_o_title(self):
        self.o_title = self.movie.get('smart canonical title')

    def get_title(self):  # same as get_o_title()
        self.title = self.movie.get('title')

    def get_director(self):
        self.director = ", ".join([director['name'] for director in self.movie.get('director', [])])

    def get_plot(self):
        self.plot = "\n\n".join([plot for plot in self.movie.get('plot', [])])

    def get_year(self):
        self.year = self.movie.get('year', '')

    def get_runtime(self):
        self.runtime = ", ".join(runtime for runtime in self.movie.get('runtimes', []))

    def get_genre(self):
        self.genre = " | ".join(self.movie.get('genres', []))

    def get_cast(self):
        cast = self.movie.get('cast', [])
        casts = []
        for cast_member in cast:
            if isinstance(cast_member.currentRole, list):
                for role in cast_member.currentRole:
                    casts.append(cast_member['name'] + " as " + role['name'])
            else:
                casts.append(cast_member['name'] + " as " + cast_member.currentRole['name'])
        self.cast = "\n".join(casts)

    def get_classification(self):
        classifications = self.movie.get('certificates', [])
        first_choice = None
        second_choice = ''
        for cert in classifications:
            if cert.startswith('USA'):
                first_choice = cert[cert.find(":") + 1:(cert.find('::') + 1) or len(cert)]
            elif cert.startswith('UK'):
                second_choice = cert[cert.find(":") + 1:(cert.find('::') + 1) or len(cert)]
        self.classification = first_choice or second_choice

    def get_studio(self):
        self.studio = ", ".join(prod.get('name') for prod in self.movie.get('production companies', []))

    def get_o_site(self):
        self.o_site = ''

    def get_site(self):
        self.site = "http://www.imdb.com/title/tt%s" % self.movie_id

    def get_trailer(self):
        self.trailer = "http://www.imdb.com/title/tt%s/trailers" % self.movie_id

    def get_country(self):
        self.country = ", ".join(self.movie.get('countries', []))

    def get_rating(self):
        self.rating = self.movie.get('rating', 0)

    def get_notes(self):
        self.notes = ''

        # TODO: Add taglines
        if self.movie.get('kind'):
            self.notes += 'Kind: ' + self.movie['kind'] + "\n"
        if self.movie.get('languages'):
            self.notes += 'Languages: ' + ", ".join(self.movie['languages']) + "\n"
        if self.movie.get('sound mix'):
            self.notes += 'Audio: ' + ", ".join(self.movie['sound mix']) + "\n"
        if self.movie.get('color info'):
            self.notes += 'Color: ' + ", ".join(self.movie['color info']) + "\n"
        if self.movie.get('taglines'):
            self.notes += 'Taglines: ' + "\n ".join(self.movie['taglines']) + "\n"

    def get_screenplay(self):
        self.screenplay = ''
        self.screenplay = ", ".join([writer['name'] for writer in self.movie.get('writer', [])])

    def get_cameraman(self):
        self.cameraman = ''
        self.cameraman = ", ".join(
            [cinematographer['name'] for cinematographer in self.movie.get('cinematographer', [])])


class SearchPlugin(movie.SearchMovie):
    def __init__(self):
        # http://www.imdb.com/List?words=
        # finds every title sorted alphabetically, first results are with a quote at
        # the beginning (episodes from tv series), no popular results at first
        # http://www.imdb.com/find?more=tt;q=
        # finds a whole bunch of results. if you look for "Rocky" you will get 903 results.
        # http://www.imdb.com/find?s=tt;q=
        # seems to give the best results. 88 results for "Rocky", popular titles first.
        super(SearchPlugin, self).__init__()
        self.original_url_search = 'http://www.imdb.com/find?s=tt&q='
        self.translated_url_search = 'http://www.imdb.com/find?s=tt&q='
        self.encode = 'utf8'
        self.ia = imdb.IMDb()

    def search(self, parent_window):
        # populate page, ids, titles
        self.ids = []
        self.titles = []
        result = self.ia.search_movie(self.title)
        for item in result:
            self.ids.append(item.movieID)
            self.titles.append(item['long imdb canonical title'])

        return self.page


#
# Plugin Test
#
class SearchPluginTest(SearchPlugin):
    #
    # Configuration for automated tests:
    # dict { movie_id -> [ expected result count for original url, expected result count for translated url ] }
    #
    test_configuration = {
        'Rocky Balboa': [8, 8],
        'Ein glückliches Jahr': [2, 2]
    }


class PluginTest(object):
    #
    # Configuration for automated tests:
    # dict { movie_id -> dict { arribute -> value } }
    #
    # value: * True/False if attribute only should be tested for any value
    #        * or the expected value
    #
    test_configuration = {
        '0138097': {
            'title': 'Shakespeare in Love',
            'o_title': 'Shakespeare in Love',
            'director': 'John Madden',
            'plot': True,
            'country': 'USA',
            'genre': 'Comedy | Drama | Romance',
            'classification': False,
            'studio': 'Universal Pictures, Miramax Films, Bedford Falls Productions',
            'o_site': False,
            'site': 'http://www.imdb.com/title/tt0138097',
            'trailer': 'http://www.imdb.com/title/tt0138097/trailers',
            'year': 1998,
            'notes': _('Language') + ': English\n' \
                     + _('Audio') + ': Dolby Digital\n' \
                     + _('Color') + ': Color\n\
Tagline: ...A Comedy About the Greatest Love Story Almost Never Told...\n\
Love is the only inspiration',
            'runtime': 123,
            'image': True,
            'rating': 7,
            'screenplay': 'Marc Norman, Tom Stoppard',
            'cameraman': 'Richard Greatrex',
            'barcode': False
        },
    }
