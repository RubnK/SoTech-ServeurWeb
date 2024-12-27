<?php
namespace App\Models;

use App\Utils\Database;
use PDO; 

class Brand extends CoreModel
{
    private $name;
    public function findAll()
    {
        $sql = "SELECT * FROM brand ORDER BY name";
        $pdo = Database::getPDO();
        $pdoStatement = $pdo->query($sql);
        $brands = $pdoStatement->fetchAll(PDO::FETCH_CLASS, Brand::class);

        return $brands;
    }

    public function find($id)
    {
        $sql = "SELECT * FROM brand WHERE id = ".$id;
        $pdo = Database::getPDO();
        $pdoStatement = $pdo->query($sql);
        $brand = $pdoStatement->fetchObject(Brand::class);
        return $brand;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setName($name)
    {
        $this->name = $name;
    }
}