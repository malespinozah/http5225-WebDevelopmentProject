<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Week 2</title>
</head>
<body>
    <?php echo('Hello'); ?>
    <?php echo '<h1>Welcome to HTTP 5225</h1>';?>
    <?php echo '<p>We will learn PHP in this class, (maybe?)</p>';?>

    <p>Things we will learn in this class:</p>
    
    <?php
    echo
    '<ul>
        <li>PHP</li>
        <li>mySQL</li>
        <li>Lavarel</li>
    </ul>';
    ?>

    <?php
    echo '<img src="http://placehold.co/600x400" alt="Placeholder image">';
    ?>
    
    <img src="<?php echo 'http://placehold.co/600x400';?>" alt="Placeholder image">

    <?php
    $fname = 'Gary';
    $lname = 'Bhanot';

    $name['fname'] = 'Maria'; 
    ?>


    <?php
    echo '<br>';
    echo 'Hello ' . $name['fname'] . '  ' . $lname;
    ?>

</body>
</html>