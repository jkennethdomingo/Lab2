<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Music Player</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <link rel="stylesheet" href="/assets/css/style.css">
</head>
<body>

<!-- Select Playlist Modal -->
<?= $this->include('modal/SelectPlaylist.php') ?>


<!-- Display -->
<form action="/" method="get">
  <input type="search" name="search" placeholder="Search song" value="<?= isset($searchQuery) ? $searchQuery : '' ?>">
  <button type="submit" class="btn btn-primary">Search</button>
</form>
<h1>Music Player</h1>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  My Playlist
</button>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addMusicModal">
    Add Music
</button>
<br></br>
<audio id="audio" controls autoplay></audio>
<ul id="playlist">
  <?php foreach (($searchResults ?? $playlistContent ?? $songs) as $result): ?>
    <li data-src="<?= "/uploads/" . $result['file_path'] ?>">
      <span><?= $result['artist'] . ' - ' . $result['title'] ?></span>
      <button class="add-to-playlist-btn" data-music-id="<?= $result['music_id'] ?>" data-toggle="modal" data-target="#addToPlaylistModal"><i class="fa-solid fa-plus"></i></button>
    </li>
  <?php endforeach; ?>
</ul>


<!-- Create Playlist Modal -->

<?= $this->include('modal/CreatePlaylist.php') ?>

<!-- Modal for input music -->

<?= $this->include('modal/AddMusic.php') ?>

<!-- Add to Playlist Modal -->

<?= $this->include('modal/AddPlaylist.php') ?>
<!-- Javascript -->
<script src="/assets/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/script.js"></script>
</body>
</html>