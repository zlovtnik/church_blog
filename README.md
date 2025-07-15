# Church Blog

A modern, production-ready Ruby on Rails 8 application for managing and publishing blog posts. Designed for simplicity, speed, and best practices, with a clean UI, PWA support, and easy deployment via Docker or [Kamal](https://kamal-deploy.org).

---

## Features

- Create, edit, and delete blog posts
- Posts have title, content, status (draft/published), published flag, and published date
- Responsive, modern UI with custom CSS
- JSON API endpoints for posts
- System, controller, and model tests included
- Progressive Web App (PWA) ready (manifest, service worker)
- Secure by default (CSP, parameter filtering)
- Easy deployment with Docker and Kamal

---

## Technology Stack

- **Ruby** 3.4.4
- **Rails** 8.0.2
- **SQLite3** (default, can be swapped for PostgreSQL/MySQL)
- **Puma** web server
- **Hotwire** (Turbo, Stimulus)
- **Propshaft** asset pipeline
- **Jbuilder** for JSON APIs
- **Solid Queue/Cache/Cable** for background jobs, caching, and websockets
- **Capybara/Selenium** for system tests
- **Brakeman, Rubocop** for security and style

---

## Getting Started

### Prerequisites
- Ruby 3.4.4 (see `.ruby-version`)
- Bundler (`gem install bundler`)
- Node.js (for JS tooling, optional)
- SQLite3 (default) or your preferred DB

### Setup

```sh
bin/setup
```
This will:
- Install Ruby gems
- Prepare the database (`bin/rails db:prepare`)
- Clear logs and tempfiles
- Start the development server (unless `--skip-server` is passed)

Or run manually:
```sh
bundle install
bin/rails db:prepare
bin/rails server
```

### Database
- Default: SQLite3 (see `config/database.yml`)
- To use PostgreSQL/MySQL, update `config/database.yml` accordingly
- Seed data: add to `db/seeds.rb` and run `bin/rails db:seed`

---

## Running Tests

- **All tests:**
  ```sh
  bin/rails test
  ```
- **System tests (browser):**
  ```sh
  bin/rails test:system
  ```
- Uses [Minitest](https://guides.rubyonrails.org/testing.html), [Capybara](https://github.com/teamcapybara/capybara), [Selenium](https://www.selenium.dev/)
- See `test/` for examples

---

## Deployment

### Docker
Build and run in production mode:
```sh
docker build -t church_blog .
docker run -d -p 80:80 -e RAILS_MASTER_KEY=your_key --name church_blog church_blog
```
- See `Dockerfile` for details
- Requires `config/master.key` for credentials

### Kamal (recommended)
- See [`config/deploy.yml`](config/deploy.yml) for configuration
- Secrets managed via `.kamal/secrets`
- Example commands:
  ```sh
  bin/kamal deploy
  bin/kamal logs
  bin/kamal console
  ```
- Supports multi-server, SSL, persistent volumes, and more

---

## Progressive Web App (PWA)
- Manifest: `app/views/pwa/manifest.json.erb`
- Service Worker: `app/views/pwa/service-worker.js`
- Add manifest/service worker routes in `config/routes.rb` and link in `app/views/layouts/application.html.erb` for full PWA support

---

## Frontend
- Custom CSS: `app/assets/stylesheets/application.css`
- Hotwire (Turbo/Stimulus): see `app/javascript/`
- Importmap: see `config/importmap.rb`

---

## Security
- Sensitive parameters filtered from logs (`config/initializers/filter_parameter_logging.rb`)
- Content Security Policy ready (`config/initializers/content_security_policy.rb`)
- Use `brakeman` and `rubocop` for static analysis

---

## Contributing
Pull requests welcome! Please:
- Write tests for new features
- Follow existing code style
- Run `bin/rubocop` and `bin/brakeman` before submitting

---

## License
[MIT](LICENSE) (or specify your license here)

---

## Credits
- Built with [Ruby on Rails](https://rubyonrails.org/)
- Inspired by modern Rails best practices
