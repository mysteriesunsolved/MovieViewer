# MovieViewer
# Project 1 - *MovieViewer*

**MovieViewer** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **15** hours spent in total

## User Stories

The following **required** functionality is complete:

- [x] User can view a list of movies currently playing in theaters from The Movie Database.
- [x] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [x] User sees a loading state while waiting for the movies API.
- [x] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [ ] User sees an error message when there's a networking error.
- [x] Movies are displayed using a CollectionView instead of a TableView.
- [x] User can search for a movie.
- [x] All images fade in as they are loading.
- [x] Customize the UI.

The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!
- I added a UISwitch through which the user can switch between the tableView and collectionView
- The user can also search using words from an overview
- The user can view the language of the film in the detail movie controller (since I noticed some weren't english)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/BmVzspk.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I took time to figure out how to use the search bar with an NSDictionary.
I couldn't figure out how to implement the network error view. 


## License

    Copyright [2015] [Sanaya Sanghvi]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0
# Project 2 - *Movie Viewer/Flicks*

**Flicks** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **7** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User can view movie details by tapping on a cell.
- [x] User can select from a tab bar for either **Now Playing** or **Top Rated** movies.
- [x] Customize the selection effect of the cell. (I didn't want to customise the selection effect since there'd be too much colour on the screen, so I set the cell selection style to none)

The following **optional** features are implemented:

- [x] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [x] Customize the navigation bar.

The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!
- Release dates are displayed below the movie (makes more sense for top rated movies given varied time periods).
- Ratings for each movie are shown with icons and vote average.
- The icons change depending on the rating of the movie. If the rating is greater than 7, it displays a fire icon, if greater than 5, it displays a thumbs up icon, and if lesser than 5 it displays a thumbs down icon.
- If a movie's vote count = 0, making the average rating 0 be default, "No ratings to show" is displayed in the rating section.
- Added a network error view I didn't finish last week.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. 
2. 

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/CXP5D5k.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright [2016] [Sanaya Sanghvi]
    
    Credits
    Katrine Kolström for the now playing icon
    Gonzalo Bravo for the top rated icon
    Dan Hetteix for the fire/excellent-rating icon

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
