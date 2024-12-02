document.addEventListener("DOMContentLoaded", function() {
  const input = document.querySelector('input[name="query"]');
  if (input) {
    input.addEventListener("input", function() {
      const query = this.value;
      if (query.length > 2) {
        fetch(`/toilets/autocomplete?query=${query}`)
          .then(response => response.json())
          .then(data => {
            // Vorschläge anzeigen (z.B. in einer Dropdown-Liste)
            const suggestions = document.getElementById("suggestions");
            suggestions.innerHTML = "";
            data.forEach(item => {
              const suggestionItem = document.createElement("div");
              suggestionItem.textContent = item;
              suggestionItem.classList.add("suggestion-item");
              suggestionItem.addEventListener("click", function() {
                input.value = item;
                suggestions.innerHTML = "";
              });
              suggestions.appendChild(suggestionItem);
            });
          });
      }
    });
  }
});
