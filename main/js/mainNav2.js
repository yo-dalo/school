document.addEventListener("DOMContentLoaded", function() {
  const menuSections = document.querySelectorAll(".navSec");
  
  menuSections.forEach((section) => {
    const li = section.querySelector("li");
    const submenu = section.querySelector(".navSecBox");
    
    if (submenu) {
      li.addEventListener("click", () => {
        const isOpen = submenu.classList.contains("open");
        
        // Close all open menus
        document.querySelectorAll(".navSecBox.open").forEach((box) => {
          box.classList.remove("open");
          box.parentElement.classList.remove("open");
        });
        
        // Toggle current
        if (!isOpen) {
          submenu.classList.add("open");
          section.classList.add("open");
        }
      });
    }
  });
});



