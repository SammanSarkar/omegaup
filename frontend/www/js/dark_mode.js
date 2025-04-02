(function() {
  // Check for saved dark mode preference
  var darkMode = localStorage.getItem('omegaup_dark_mode') === 'true';
  
  // Apply theme function
  function applyDarkTheme(isDark) {
    if (isDark) {
      document.documentElement.classList.add('dark-theme');
      if (document.body) {
        document.body.classList.add('dark-theme');
      }
    } else {
      document.documentElement.classList.remove('dark-theme');
      if (document.body) {
        document.body.classList.remove('dark-theme');
      }
    }
  }
  
  // Apply immediately to html
  applyDarkTheme(darkMode);
  
  // Also apply when DOM is fully loaded
  document.addEventListener('DOMContentLoaded', function() {
    applyDarkTheme(darkMode);
  });
  
  // Make the theme toggle function globally available
  window.toggleOmegaUpDarkTheme = function(isDark) {
    localStorage.setItem('omegaup_dark_mode', isDark.toString());
    applyDarkTheme(isDark);
  };
})(); 