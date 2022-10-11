# Jogging API

## Table of Contents

- [Table of Contents](#table-of-contents)
- [About Project](#about-project)
- [Functionality](#Functionality-requirements)
- [Built With](#built-with)
- [Getting Started](#getting-started)
- [API Interactions](#api-interactions)
- [Contributing](#contributing)
- [Authors](#authors)
- [Acknowledgements](#acknowledgements)
- [Show your support](#show-your-support)

## About Project

A RESTful API that tracks the jogging times of users.

## Functionality requirements

- Authentication: Create account / login / logout. ☑️
- When logged in, a user can view, edit and delete entered `jogging times`. ☑️
- Authorization Implement three roles with different permission levels:
  - A regular user would only be able to CRUD on their owned records, ☑️
  - A user manager would be able to CRUD users, ☑️
  - an admin would be able to CRUD all records and users. ☑️
- Analysis
  - Filter dates by from to. ☑️
  - Report on
    - average speed & ☑️
    - distance per week. ☑️

## Built With

- Ruby '3.0.1'
- Rails '7.0.4'

## Getting Started

- Clone this repo

  ```bash
  git clone https://github.com/Bishoy-Samwel/JoggingAPI
  ```

- Navigate to JoggingAPI directory

  ```bash
  cd JoggingAPI
  ```

**Credentials**

- Generate a Key

```bash
rake secret
```

- Copy the key

```bash<
EDITOR="code --wait" rails credentials:edit --environment=development
```

- Add and past the key here

```bash
devise:
 jwt_secret_key: <key>
```

- On the comandline, at the project's root, run `bundle i` to install app dependencies
- `rails db:create`
- `rails db:migrate`
- `rails start`

- Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

## API Interactions

[JoggingAPI.postman_collection.json](JoggingAPI.postman_collection.json)

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Bishoy-Samwel/JoggingAPI/issues)

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/newFeature`)
3. Commit your Changes (`git commit -m 'Add some newFeature'`)
4. Push to the Branch (`git push -u origin feature/newFeature`)
5. Open a Pull Request

## Author

👤 **Bishoy Samwel Faheem**

- GitHub: [@Bishoy Samwel Faheem](https://github.com/Bishoy-Samwel)
- LinkedIn: [Bishoy Samwel](https://www.linkedin.com/in/bishoy-samwuel-ss/)
- Twitter: [@bisho](https://twitter.com/BishoFaheem15)

## Acknowledgements

- [Rolify](https://github.com/RolifyCommunity/rolify)
- [Pundit](https://github.com/varvet/pundit)
- [Devise-JWT](https://github.com/waiting-for-dev/devise-jwt)

## Show your support

Give a ⭐️ if you like this project!
