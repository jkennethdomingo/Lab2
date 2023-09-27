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
      <?php if($currentPlaylistId !== 0): ?>
          <a href="<?php echo base_url('//remove/' . $result['playlist_music_id'] . '/' . $result['playlist_id']); ?>" class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Remove from Playlist</a>
      <?php endif; ?>
    </li>
  <?php endforeach; ?>
</ul>