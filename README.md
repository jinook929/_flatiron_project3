# Exilic Rails App

by Jinook Jung

* * * * * * * * * *

## How To Set Up the App

1. Visit my [Github repository](https://github.com/jinook929/_flatiron_project3) and clone the code to your local directory:

 `git clone https://github.com/jinook929/_flatiron_project3.git`

2. Enter into the *_flatiron_project3* folder: `cd _flatiron_project3`.
3. Execute `bundle install` and run `rails s` in terminal.
4. Then, open your browser at `http://localhost:3000/`.

## How To Use the App

1. You can either sign up for your own account or use the existing accounts to log in (You can also sign in via your Google account).
2. Before logging in, you still can see evnet list and some informational pages, but you are unable to make reservations.
3. If you log in as normal user (`test@users.com`, password: 123), you can create, update, and delete your own registration.
4. If you log in as admin user (`abc@users.com`, password: 123), you can read, create, update, and delete events, and create, read, update, and delete comments, and read the users.
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
t.string :name
t.string :email
t.string :password_digest
t.boolean :admin, default: false
t.timestamps
```

#### events

``` ruby
t.string :title
t.date :date
t.time :time, default: "12:00"
t.boolean :onsite, default: false
t.text :description
t.integer :spots
t.timestamps
```

#### registrations

``` ruby
t.boolean :family, default: false
t.integer :user_id
t.integer :event_id
t.timestamps
```

### Model Associations & Validations

#### User

``` ruby
  has_many :registrations, dependent: :delete_all
  has_many :events, through: :registrations

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
```

#### Event

``` ruby
  has_many :registrations, dependent: :delete_all
  has_many :users, through: :registrations

  validates_presence_of :title, :date, :time, :description, :spots
```

#### Registration

``` ruby
  before_create :register

  belongs_to :user
  belongs_to :event
  
  private

  def register
    self.event.spots -= 1
    self.event.save
  end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jinook929/_flatiron_project3. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## Contributors

* Jinook Jung <jinook929@gmail.com>

## License & Copyright

© Jinook Jung

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
