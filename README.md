# SoTech

SoTech is an eCommerce website project focused on selling software.

## Installation

### Prerequisites

- PHP 7.4 or higher
- Composer
- Web server (e.g., Apache, Nginx, or PHP built-in server)
- MySQL database

### Steps

1. Clone the repository:
    ```bash
    git clone https://github.com/RubnK/SoTech-ServeurWeb.git
    cd SoTech-ServeurWeb
    ```

2. Install dependencies using Composer:
    ```bash
    composer install
    ```
    
3. Update the configuration file:
    Open the `app/config.ini` file and set your database configuration:
    ```ini
    DB_HOST=localhost
    DB_NAME=ecom
    DB_USERNAME=username
    DB_PASSWORD=password
    ```
    
4. Import the `db.sql` file into your database

## Running the Server

To start the server, use the following command:
```bash
php -S localhost:5001 -t public
```

Then, open your web browser and navigate to http://localhost:5001.

## License

This project is licensed under the MIT License.
