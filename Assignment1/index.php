<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <title>Favourite Albums</title>
</head>

<body>

    <div class="container">
        <h1>Favourite Albums</h1>
        <p>This list shows all my favourite albums from the last 6 years.</p>
        <div class="row">

            <?php
            // Connection to database
            $connect = mysqli_connect('localhost', 'root', 'root', 'Favourite Music');

            if (!$connect) {
                // For error handling
                echo 'Error code: ' . mysqli_connect_errno();
                echo 'Error message: ' . mysqli_connect_error();
                exit;
            }

            // GET data for Albums Collection
            $queryAlbums = 'SELECT Album_ID, Album_Name, Album_Year, Album_Artist FROM Albums';
            // Run and execute query
            $resultAlbums = mysqli_query($connect, $queryAlbums);

            if (!$resultAlbums) {
                echo 'Error code: ' . mysqli_errno($connect);
                echo 'Error message: ' . mysqli_error($connect);
                exit;
            }

            // Check if the result has rows
            if (mysqli_num_rows($resultAlbums) > 0) {
                while ($album = mysqli_fetch_assoc($resultAlbums)) {
                    $albumid = $album['Album_ID'];

                    // Construct the image path
                    $imagePath = 'images/' . $albumid . '.jpeg';

                    // GET data for songs based on the album
                    $querySongs = 'SELECT Album_ID, Song_ID, Song_Name FROM Songs WHERE Album_ID = ' . $albumid;
                    $resultSongs = mysqli_query($connect, $querySongs);

                    // Output accordion item
                    echo '<div class="col-md-3 mt-2 mb-2">
                        <div class="card">
                        <div class="cover">
                            <img src="' . $imagePath . '" class="img-fluid" alt="' . $album['Album_Name'] . ' Cover">
                        </div>
                          <div class="card-body">
                            <h5 class="card-title">' . $album['Album_Name'] . '</h5>
                            <p class="card-text">' . $album['Album_Year'] . '</p>
                            <span class="badge bg-secondary">' . $album['Album_Artist'] . '</span>';

                    if ($resultSongs && mysqli_num_rows($resultSongs) > 0) {
                        echo '<ul>';
                        while ($song = mysqli_fetch_assoc($resultSongs)) {
                            echo '<li>' . $song['Song_Name'] . '</li>';
                        }
                        echo '</ul>';
                    } else {
                        echo '<p>No songs found for this album.</p>';
                    }

                    echo '</div></div></div>';
                }
            } else {
                echo '<p>No albums found.</p>';
            }

            // Close the connection
            mysqli_close($connect);
            ?>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>
