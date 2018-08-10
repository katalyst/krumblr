# Krumblr

The blog is the quintessential 'Hello World' app for Rails. But who has time to
read a long blog post anymore? Krumblr is a Tumblr-like app which allows users
to post short snippets. The brief for the features is deliberately vague so
that we can see how you interpret the requirements and solve problems
accordingly.

As you work, please keep a log of the time you spend on various features.

>  **Sam Wan**: Total time spent approximately 11hrs over 5 days.

## Core Features

At a minimum the following features should be implemented:

- [x] Users can sign up and create and manage one or more blogs. 

>  **Sam Wan**: 
>  * Users can sign in/up/off using the default Devise workflow.  No extra configuration was done to the Devise flow
>  * Creation of a blog can be found in the top right menu.
>  * Managing (edit/delete) of a blog can be found under `Manage Blog` of the Blog Index page

- [x] Users can create posts on the blogs.

>  **Sam Wan**: 
>  * Used `Simple Form` for the forms.
- [x] Posts can be text-only.

## Extra Features

These are additional features which do not have to be implemented (although
we'd like to see at least a couple of them). Feel free to pick and choose from
the following the things you'd like to demonstrate or that might pose an
interesting challenge. You're not limited to what's in this list here, so if
there's an interesting feature you'd like to try out, please do. These are just
a few ideas to implement:

- [ ] Comments on posts
- [x] Tags/categories on posts 

>  **Sam Wan**:  For this exercise I 'rolled-my-own' tagging system.  Were this a production app I would most likely have used `ActsAsTaggableOn` and integrated that.
>  * Made a simple text-based tag editor for freetext Tagging

- [ ] Reblogging posts
- [x] Liking posts 

>  **Sam Wan**: I've added a `Reaction` model to track a user's reaction to a post.  An authenticated user can only react once per post, and selecting a different reaction updates your reaction for that post.

- [ ] Different post types (images, code snippets, embedded video, etc.)
- [x] Searching the contents of a blog 

>  **Sam Wan**:  The search functionality uses both `Tag.name` and `Post.title`.  The way the search is implemented isn't way I would have done it for a full production.  
>    * Using an sql `like %QUERY%` would be an exspensive operation as the site grows
>    * There is no weighting to search results.  A match is a match is a match.
>  
>  On a full-site, I would have used elastic search (ngram + other filters on searchable fields), weighting the `Post.title`, `Post.content` and then `Tag.name`.  The 'Related tags' could also be implemented using elastic search 'similar' query.

You can implement as many or as few of these as you'd like. **More features/
more work is not necessarily better**. Code quality is important, so a couple
of features implemented well goes a long way.

## Notes

* You're welcome to use gems for various features; we're interested in how you
  solve problems though, so maybe don't use them for everything.

  For Katalyst projects, we regularly use
  * [`Devise`](https://github.com/plataformatec/devise)
    (including [`OmniAuth`](https://github.com/omniauth/omniauth));
  * [`SimpleForm`](https://github.com/plataformatec/simple_form); and
  * [`FriendlyId`](https://github.com/norman/friendly_id)

  so you're welcome to include any or all of these in your project. Of course,
  you're always free to use something different or roll your own option if you
  prefer. Let us know either directly or in comments the reasons for your
  choices! We always want to learn new things, too.
* You're welcome to include a CSS framework (or style it from scratch) to
  you're liking, but again, it's about the approach to problem solving. UI
  is part of that, but it doesn't have to be the main focus.

>  **Sam Wan**: Used bootstrap/bootswatch to get something up and running quickly.

* You can switch to PostgreSQL or MySQL/MariaDB, but stick with ActiveRecord.

>  **Sam Wan**: Used sqllite to quickly get this running.  Dummy data located in `seeds.rb`

* Testing is important, so make sure you have appropriate coverage with specs.
* This project is set up to use RSpec, but you're welcome to use MiniTest or
  another test framework if you prefer.
* Readable code is good; comments are appreciated where things aren't
  immediately obvious.
* You can change the `.ruby-version` if required; the minimum required version
  is `2.4.1` for Rails 5.2.
* For junior candidates with no prior Rails experience, we will primarily be assessing
  your ability to learn over the course of the challenge.
* For senior candidates, we'd like to be able to assess your problem solving
  skills, not just your rails knowledge. If you wish to tackle a different extra
  feature that might better prove your ability to problem solve, you're welcome to discuss
  it with us.


## Setup

* Fork this repo. Keep the forked repo public, too.
* Code your app.
* Commit your changes (frequent commits are good; separate branches for
  different features are also good).
* Send us a link and/or submit a pull request so we can see what you've done.

If you'd like to show us a working app, you could deploy to something like
Heroku, or even include CI using Travis, but don't feel obliged. As long as we
can get it up and running on localhost, that's fine.
