# Sweater Weather

---

## Contributors

|Kevin Nguyen|
|--- |
|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/denverdevelopments)
|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/jacqwhitmer/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/dane-brophy/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/isika/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/ezzedine-alwafai/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/kevin-nguyen-59510520a/)


## Tools Used

|Development|Development|Testing
|--- |--- |--- |
|[<img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/en/downloads/)|[<img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)|[ <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/rspec/rspec-rails)|
|[ <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />](https://rubygems.org/gems/rails/versions/5.2.6)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://desktop.github.com/)|[<img src="https://img.shields.io/badge/capybara-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/teamcapybara/capybara)|
|[<img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/pry/versions/0.10.3)|[<img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/lostisland/faraday)|[<img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/bblimke/webmock)
|[<img src="https://img.shields.io/badge/sql-postgreSQL-green"/>](https://www.postgresql.org/)|[<img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />](https://www.postman.com/product/rest-client/)|[<img src="https://img.shields.io/badge/-VCR-lightgrey"/>](https://github.com/vcr/vcr)


</div>

<div align="center">

## Setup

</div>


  This project requires Ruby 2.7.2.

  * Fork this repository
  * From the command line, install gems and set up your DB:
      * `bundle install && bundle update`
      * `rails db:{create,migrate,seed}`
  * Run the test suite with `bundle exec rspec -fd`
  * Run your development server with `rails s` to see the app in action.

#### Project Configurations

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/prekinder/frontend/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 5.2.6
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate,seed}
      Created database 'sweater_weather_development'
      Created database 'sweater_weather_test'
      ```

      ```bash
      $ bundle install
      ```

  * [API key configuration](https://github.com/laserlemon/figaro)
      ```bash
      $ bundle exec figaro install
      ```
      Add your credentials & API keys to `config/application.yml`:

      ```yml
      #Backend Repo:
      1st API: go to [Mapquest API] to request an API key<br>
      2nd API: at [Open Weather API] to request an API key<br>
      ```

  * How to run the test suite
      ```bash
      $ bundle exec rspec -fd
      ```

  * [Local Deployment](http://localhost:3000), for testing
      ```bash
      $ rails s
      => Booting Puma
      => Rails 5.2.6 application starting in development
      => Run `rails server -h` for more startup options
      Puma starting in single mode...
      * Version 3.12.6 (ruby 2.7.2-p137)
      * Min threads: 5, max threads: 5
      * Environment: development
      * Listening on tcp://localhost:3000
      Use Ctrl-C to stop
      ```



<div align="center">

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/pre-kinder/front-end.svg?style=flat-square
[contributors-url]: https://github.com/pre-kinder/front-end/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/pre-kinder/front-end.svg?style=flat-square
[forks-url]: https://github.com/pre-kinder/front-end/network/members
[stars-shield]: https://img.shields.io/github/stars/pre-kinder/front-end.svg?style=flat-square
[stars-url]: https://github.com/pre-kinder/front-end/stargazers
[issues-shield]: https://img.shields.io/github/issues/pre-kinder/front-end.svg?style=flat-square
[issues-url]: https://github.com/pre-kinder/front-end/issues
[build-badge]: https://img.shields.io/circleci/build/github/pre-kinder/front-end?style=flat-square
