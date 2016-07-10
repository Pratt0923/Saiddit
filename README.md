[![Code Climate](https://codeclimate.com/github/Pratt0923/Saiddit/badges/gpa.svg)](https://codeclimate.com/github/Pratt0923/Saiddit)[![Test Coverage](https://codeclimate.com/github/Pratt0923/Saiddit/badges/coverage.svg)](https://codeclimate.com/github/Pratt0923/Saiddit/coverage)

##Saiddit is your one stop shop for everything on the internet! Want to share a funny link? Just post to 'funny' to share your link!

###On Saiddit you can:
  * Create new posts
  * Order your posts by any Saiddit that you wish!
  * Edit posts that belong to you
  * Delete posts that belong to you
  * Search the board for Saiddits you want
  * Comment on posts that you think are interesting
  * Log in and out securely
  * Edit your account
  * See what posts belong to which Saiddits
  * View posts that you have made
  * Vote on posts
    * Voting is catagorized by 'up' and 'down' votes
    * Voting is displayed to the left of the post by the two numbers on the side and with number values.
  All posts on the front page of Saiddit are sorted by the value of their votes, and by the time that they were created.

## To get started
 To do anything on Saiddit, you have to log in. Please input an email address that is valid, as before accessing Saiddit you must confirm your email address. Saiddit will send out a email within 2-5 minutes so please be paitent.

### The Navigation Bar
In the Navigation Bar, users can visit my GitHub as well as my LinkedIn. In addition, there are links for users to view their own posts, as well as to make a new post.

### Making a new post
When a user makes a new post, they must give it a title, content, and the subreddit that they wish to add the post to. Once they click "Submit" the post will be added and they will be able to see it under "Your Posts"!

### Updating a post
If you are the owner of a post, or if you are admin, you can edit posts! General Users can only edit posts that they have made. To edit a post click on the "edit" button that will appear on each post. You will be taken to page that displays the post that you want to edit. After you edit the post then resubmit it and it will replace your old post.

### Deleting a post
If you are theh owner of a post, an admin, or a mod of a particular subreddit, then you can delete posts. To delete posts simply click one the "delete" button that is next to each post and the post will be deleted.

### Upvotes and Downvotes
Upvotes and Downvotes are an important part of posting! When your post gets more upvotes it will appear higher on the page and more people will see it! If it has more downvotes it will move down on the page and less people will see it.\

### Comments and Replies
It would not be fully realized website if you could not add comments and replies to other users posts! First off comments. Comments are the initial reply to a post. If you want to let someone know something about their post, leave them a comment. Below each post there is a link to the comments of a post and how many comments the post already has. Once you have clicked on the comments link, you will be taken to a page that just displays the post that you are interested in. Above the post there will be an "Add a New Comment!" button and all you have to do is click on it to add a comment. Each comment added has a reply button next to it. Simply click on this Reply button to leave a reply to the comment. Users can edit and delete comments and replies that they have posted!

## Admins
Admins are an important part of the Saiddit structure, as they can regulate things and keep users in line. Admins have the ability to edit any post, to delete any post, and to invite mods as well as other admins. To invite other Admins and Moderators, Admins need to click on the "Invite Mods" button that is on the side bar. Clicking this will take them to a page where they will specify the email address of the person that they want to invite. They must also specify what rank they want the invited user to be. Once they submit this, the invited user will be sent an email and a link where they can finish creating their account by adding a password.

## Mods
Mods are in control of certain Saiddits. A Moderator is assigned to a Saiddit when they are invited. Moderators have all the power that Admins do, but only in the Saiddit that they are assigned to. Mods cannot invite other users.

## Important notes
Thank you for reading all of this! If you are developer or just want to check out some important bits of this application, good places to look are:
  * The Post Controller - this is where all of the posts are created and where most of the work is done.
  * The Replies Controller - this is very similar to the posts controller but includes extra information because replies has to understand comments, posts, and replies!
  * Post Policy - This is the most fleshed out policy, as this is where most of the editing and updating will happen. If you are interested in the Policies, this is probably the one to look at.
  * Views - the views are very interesting and hold a lot of information about how params get passed from the user to the controllers.
