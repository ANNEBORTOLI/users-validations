# Festalab Demo - User validations

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [:notebook_with_decorative_cover:About the project](#notebook_with_decorative_coverabout-the-project)
  - [🛠️Technologies](#🛠️technologies)
  - [📑Business rules](#�business-rules)
  - [:card_file_box:Database Schema](#card_file_boxdatabase-schema)
  - [:truck:Endpoints](#truckendpoints)
- [:book:General instructions](#bookgeneral-instructions)
  - [:electric_plug:Installation](#electric_pluginstallation)
- [:book:Usage Examples](#bookusage-examples)
- [:technologist:Developer](#developer)

<!-- ABOUT THE PROJECT -->

## :notebook_with_decorative_cover:About the project

This is an application build with TDD using Ruby on Rails, using the Bootstrap styling library and the JavaScript framework Stimulus.

The main objetive of this application is to apply validations to the filled fields and display the filling errors in their respective fields.

It's also possible to see a list of all Users and search for other users by any attribute.

### 🛠️Technologies

<ul>
  <li>Ruby 3.1.2</li>
  <li>Rails 7.0.8</li>
  <li>SQLite</li>
  <li>HTML5</li>
  <li>CSS3</li>
  <li>Bootstrap</li>
  <li>Stimulus</li>
  <li>Regex</li>
  <li>Minitest</li>
</ul>

### 📑Business rules

- Everyone can add a new User to the list (unauthenticated);
- The model should validate the email, name, phone, and CPF format before saving and display an error message if it's invalid;
- The index page should be able to search for data by any of the fields;
- The data should be organized in the view;
- A valid phone

### :card_file_box:Database Schema

<div align="center">
  <img src="public/user-table.png">
</div>

### :truck:Endpoints

- User Endpoints

| URL / ENDPOINT | VERB   | DESCRIPTION      |
| -------------- | ------ | ---------------- |
| /users         | GET    | Return all Users |
| /users/:id     | GET    | Return a User    |
| /users         | POST   | Create a User    |
| /users/:id     | PATCH  | Update a User    |
| /users/:id     | DELETE | Delete a User    |

Prefix Verb URI Pattern Controller#Action
users GET /users users#index
POST /users users#create
new_user GET /users/new users#new
edit_user GET /users/:id/edit users#edit
user GET /users/:id users#show
PATCH /users/:id users#update
PUT /users/:id users#update
DELETE /users/:id

<!-- GETTING STARTED -->

## :book:General instructions

Below are the instructions for the installation, configuration, and use of the application.

### :electric_plug:Installation

1. Clone the repo

```sh
   git clone https://github.com/ANNEBORTOLI/users-validations
   cd users-validations
```

2. Installing Packages(gems)

```sh
    bundle install
```

3. Create a db, run migrations and run seed

```sh
    rails db:create db:migrate db:seed
```

4. Run tests

```sh
    bundle exec rspec
```

5. Run the Application locally

```sh
    rails s
    Visit https://localhost:3000.com
```

## :camera_flash:Usage Examples

- Users List:
<div align="center">
  <img src="public/create-user.png">
</div>
<br>

- Searching for User:
<div align="center">
  <img src="public/create-user.png">
</div>
<br>

- Creating new User:
<div align="center">
  <img src="public/create-user.png">
</div>
<br>

## :technologist:Developer

<table>
    <tr align="center">
        <td>
            <a href="https://github.com/ANNEBORTOLI" target="_blank">
              <img src="https://avatars.githubusercontent.com/u/62453211?v=4" height="150px">
            </a>
        </td>
    </tr>
    <tr align="center">
        <td>
        <a href="https://www.linkedin.com/in/anne-bortoli/" target="_blank">Anne Bortoli</a>
        </td>
    </tr>
</table>

## TODO'S

-[x] Utilizar a gem cpf para a validação de cpf https://github.com/fnando/cpf_cnpj;
-[] TODO: o email 'teste1@email' está passando como válido no update
-[] Método customizado com regex para validar phone;

-[] Criar seeds com faker;
-[] TDD front-end com Capybara;
-[] TDD model e routes com Minitest;
