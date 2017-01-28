/*1. Create a query to get all fields from the `users` table*/

SELECT *
FROM users;

/*1. Create a query to get all fields from the `posts` table where the `user_id` is 100*/

SELECT *
FROM posts
WHERE posts.users = 100;

/*1. Create a query to get all posts fields, the user's first name, and the user's last name, from the `posts` table where the user's id is 200*/

SELECT posts.*, first_name, last_name
FROM posts
INNER JOIN users ON posts.users = users.id
WHERE posts.users = 200;

/*1. Create a query to get all posts fields, and the user's username, from the `posts` table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'*/

SELECT posts.*, username
FROM posts
INNER JOIN users ON posts.users = users.id
WHERE first_name = 'Norene' AND last_name = 'Schmitt';

/*1. Create a query to get usernames from the `users` table where the user has created a post after January 1, 2015*/

SELECT users.username
FROM users
INNER JOIN posts ON posts.users = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';

/*1. Create a query to get the post title, post content, and user's username where the user who created the post joined before January 1, 2015*/

SELECT title, content, users.username
FROM posts
INNER JOIN users ON posts.users = users.id
WHERE posts.created_at > '2015-01-01 00:00:00-10';
/*1. Create a query to get the all rows in the `comments` table, showing post title (aliased as 'Post Title'), and the all the comment's fields*/

SELECT comments.*, "Post Title"
FROM posts p (id, "Post Title")
INNER JOIN comments ON p.id = comments.posts;
/*1. Create a query to get the all rows in the `comments` table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015*/

SELECT post_title, post_url, comment_body
FROM posts p (id, post_title, post_url)
INNER JOIN comments c (id, comment_body)
ON p.id = c.posts
WHERE p.created_at > '2015-01-01 00:00:00-10';

/*1. Create a query to get the all rows in the `comments` table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'*/

SELECT post_title, post_url, comment_body
FROM posts p (id, post_title, post_url)
INNER JOIN comments c (id, comment_body) ON p.id = c.posts
WHERE comment_body LIKE '%USB%';

/*1. Create a query to get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix' ( should have 855 results )*/

SELECT post_title, first_name, last_name, comment_body
FROM posts p (id, post_title)
INNER JOIN users u (id, username, first_name, last_name) ON u.id = p.users
INNER JOIN comments c (id, comment_body) ON p.id = c.posts
WHERE c.comment_body LIKE '%matrix%';

/*1. Create a query to get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum' ( should have 102 results )*/

SELECT first_name, last_name, comment_body
FROM comments c (id, comment_body)
INNER JOIN users ON users.id = c.users
INNER JOIN posts ON posts.id = c.users
WHERE c.comment_body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

/*1. Create a query to get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo' ( should have 218 results )*/

SELECT post_author_first_name, post_author_last_name, post_title, comment_author_username, comment_body
FROM users u (id, comment_author_username, post_author_first_name, post_author_last_name)
INNER JOIN posts p (id, post_title) ON p.users = u.id
INNER JOIN comments c (id, comment_body) ON c.posts = p.id
WHERE (c.comment_body LIKE '%SSL%'
  OR c.comment_body LIKE '%%FIREWALL')
  AND p.content LIKE '%%nemo';




