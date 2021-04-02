# TraVlog Sinatra App

by Jinook Jung

* * * * * * * * * *

## How To Set Up the App

1. Visit my [Github repository](https://github.com/jinook929/_flatiron_project2) and clone the code to your local directory:

 `git clone https://github.com/jinook929/_flatiron_project2.git`

2. Enter into the *_flatiron_project2* folder: `cd _flatiron_project2`.
3. Execute `bundle install` and run `shotgun` in terminal.
4. Then, open your browser at `http://localhost:9393/`.

## How To Use the App

1. You can either sign up for your own account or use the existing accounts to log in.
2. Before logging in, user still can see vlog list by countries and each individual vlog from there, but no more than that.
3. If you log in as `super` (password: 123), you can create, read, update, and delete vlogs, comments, and even users, like making someone else admin, except for deleting yourself.
4. If you log in as `admin` (password: 123), you can create, read, and update vlogs, and create, read, update, and delete comments, and read the users.
5. If you log in as normal user (`user`, password: 123), you can create, update, and delete your own vlogs and comments, and read all vlogs and comments.
6. Each user has access to his/her own profile (user info, vlog info, country info, and comment info) through `Welcome, USER` link on the navbar.
7. Keyword search is available for any logged-in user via the search box on the navbar.

## Screen Captures

### Landing Page

![Landing Page](./public/images/01_landing.png)

### Signup Page

![Signup Page](./public/images/02_signup.png)

### Login Page

![Login Page](./public/images/03_login.png)

### Country List Page

![Country List Page](./public/images/04_countrylist.png)

### Vlog List Page

![Vlog List Page](./public/images/05_vloglist.png)

### Profile Page

![Profile Page](./public/images/06_profile.png)

### Vlog Page

![Vlog Page](./public/images/07_vlog.png)

### New Vlog Page

![New Vlog Page](./public/images/08_newvlog.png)

### Edit Vlog Page

![Edit Vlog Page](./public/images/09_editvlog.png)

### Comment Section

![Comment Section](./public/images/10_comment.png)

### Edit Comment

![Edit Comment](./public/images/11_editcomment.png)

### Search Results

![Search Results](./public/images/12_search.png)

## Data Structure

### Tables

#### users

``` ruby
  t.string :username
  t.string :email
  t.string :password_digest
  t.boolean :admin, default: false # (except for the first user)
  t.boolean :super, default: false # (except for the first user)
```

#### posts

``` ruby
  t.string :title
  t.text :content
  t.string :youtube
  t.integer :country_id
  t.integer :user_id
```

#### countries

``` ruby
  t.string :name
  t.string :url
```

#### comments

``` ruby
  t.string :content
  t.integer :post_id
  t.integer :commenter_id
```

### Model Associations & Validations

#### User

``` ruby
  has_many :posts
  has_many :comments, foreign_key: "commenter_id"
  has_many :countries, through: :posts, source: :country
  has_many :commented_posts, through: :comments, source: :post

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
```

#### Post

``` ruby
  belongs_to :user  
  belongs_to :country
  has_many :comments
  has_many :commenters, through: :comments, source: :user

  validates :title, presence: true
  validates :content, presence: true
  validates :youtube, presence: true
```

#### Comment

``` ruby
  belongs_to :post
  belongs_to :commenter, class_name: "User"

  validates :content, presence: true
```

#### Country

``` ruby
  has_many :posts

  validates :name, presence: true
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jinook929/_flatiron_project1. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Contributors

* Jinook Jung <jinook929@gmail.com>

## License & Copyright

© Jinook Jung

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
