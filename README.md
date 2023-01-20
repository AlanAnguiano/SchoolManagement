# README

ruby version = ruby-3.1.3

## First Steps

  - Clone the repo

```console
  $ bundle install
```

  - change your master.key to the correct one( is not correct to post it here, but is just a test: **8383fa33fc7577f69630f8a384b20933**)
  
  - now you are able to see the database password, so, set up a postgres username with the name specified in config/database.yml and the provided password
  
```console
  $ npm install
```

- then

```console
  $ yarn build
```

- then

```console
  $ yarn build:css
```

## Now is time to setup database

```console
  $ rake db:setup
```

## Login
The app will ask you for login, just use the default admin:

```console
  Email: admin@test.com

  Password: admin123
```

