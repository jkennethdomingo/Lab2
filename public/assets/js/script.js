// Passing value to id
document.addEventListener("DOMContentLoaded", function () {
    const addToPlaylistButtons = document.querySelectorAll(".add-to-playlist-btn");

    addToPlaylistButtons.forEach(function (button) {
      button.addEventListener("click", function () {
        const musicId = this.getAttribute("data-music-id");
        document.getElementById("musicId").value = musicId;
      });
    });
  });

// Get the audio element
var audio = document.getElementById('audio');
var isPlaylistModalOpen = false;
var playlistItems = document.querySelectorAll('#playlist li');

playlistItems.forEach(function (item) {
  item.addEventListener('click', function (event) {
    if (event.target.tagName !== 'BUTTON') {
      if (!isPlaylistModalOpen) {
        var src = this.getAttribute('data-src');
        audio.src = src;
        audio.play();
      }
    }
  });
});

// Show "Add to Playlist" modal when the button is clicked
document.querySelectorAll('.add-to-playlist-btn').forEach(function (button) {
  button.addEventListener('click', function () {
    $('#exampleModal').modal('hide'); 
    $('#addToPlaylistModal').modal('show'); 
    isPlaylistModalOpen = true; 
  });
});

$('#addToPlaylistModal').on('hidden.bs.modal', function () {
  isPlaylistModalOpen = false;
});

  document.getElementById('showPlaylistModal').addEventListener('click', function() {
    $('#exampleModal').modal('hide'); 
    $('#playlistModal').modal('show'); 
  });

   document.getElementById('playlistForm').addEventListener('submit', function(event) {
    event.preventDefault();
    var playlistSelect = document.getElementById('playlistSelect');
    var selectedPlaylist = playlistSelect.options[playlistSelect.selectedIndex].value;
    var musicID = document.getElementById('musicID').value;
    $('#playlistModal').modal('hide');
  });

  // Opening the "Create Playlist" modal
  document.querySelector('#exampleModal .modal-footer a[data-bs-target="#createPlaylistModal"]').addEventListener('click', function() {
    $('#exampleModal').modal('hide');
    $('#createPlaylistModal').modal('show'); 
  });
