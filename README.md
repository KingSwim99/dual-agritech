# Dual Agritech™

Marketing and outreach website for the **Dual Agritech™** program — a tech-voc
agricultural training system run through the **Pampamilyang Paaralang
Agrikultura Foundation, Inc. (PPAFI)** and its two implementing training
centers:

- **Dagatan Family Farm School, Inc. (DFFSI)** — TESDA-accredited training
  center for boys, based in Dagatan.
- **Balete Family Farm School, Inc. (BFFSI)** — training center for girls,
  based in Balete.

Both centers run a 6-month classroom + 6-month on-the-job training model
combining agricultural science with hands-on farm technology.

The site presents the program to prospective trainees, sponsors, and
partners, and collects inquiries through several forms (contact, donation,
trainee/sponsor applications).

## Features

- Public marketing pages: home, about (PPAFI / DFFSI / BFFSI), partners,
  gallery, resources
- Inquiry forms for contact, donations, trainee applications, and sponsor
  applications, protected by Google reCAPTCHA v3
- Brochure and MOA/TESDA PDF downloads
- Photo gallery of training centers and activities
- Responsive UI built with Bootstrap 5 and Slim templates

## Tech Stack

- **Ruby** 3.4.9 / **Rails** 8.1
- **PostgreSQL** (via `pg`)
- **Puma** web server, deployed behind **Thruster**
- **Hotwire** (Turbo + Stimulus), **Propshaft** asset pipeline
- **Dart Sass** + **Bootstrap 5** for styling
- **Slim** templating
- **Solid Queue / Solid Cache / Solid Cable** for background jobs, caching,
  and Action Cable (database-backed, no Redis required)
- **Active Storage** with `image_processing` for gallery/media variants
- **Recaptcha** (Google reCAPTCHA v3) for form spam protection
- **Kamal** for container-based deployment

## Getting Started

### Prerequisites

- Ruby 3.4.9 (see `.ruby-version`)
- PostgreSQL
- Node not required — JS is managed via import maps

### Setup

```bash
bundle install
bin/rails db:setup
```

Set up required credentials/environment variables (reCAPTCHA keys, mailer
settings, etc.) via `bin/rails credentials:edit` or your `.env` of choice.

### Run locally

```bash
bin/dev
```

This uses `Procfile.dev` to run the Rails server and the Dart Sass watcher
together. Visit `http://localhost:3000`.

### Tests

```bash
bin/rails test
bin/rails test:system
```

## CI

GitHub Actions (`.github/workflows/ci.yml`) runs on every push/PR to `main`:

- **scan_ruby** — Brakeman static security scan + `bundler-audit`
- **scan_js** — `bin/importmap audit` for JS dependency vulnerabilities
- **lint** — RuboCop (Omakase style)
- **test** — Rails test suite against PostgreSQL
- **system-test** — Capybara/Selenium system tests, uploading screenshots on
  failure

## Deployment

The app is container-ready via **Kamal**/Docker and is currently deployed to
Heroku (`production` and `staging` environments). See `Procfile`,
`Dockerfile`, and `config/deploy*.yml` for deployment configuration.
