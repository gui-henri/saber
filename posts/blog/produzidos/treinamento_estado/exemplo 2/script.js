// --- Global State ---
let globalCount = 0;

// --- DOM Elements ---
const counterBtn = document.getElementById('counter-btn');
const boxes = document.querySelectorAll('.box');
const toggleBtns = document.querySelectorAll('.toggle-btn');

// --- Functions ---

/**
 * Updates the Global State and syncs UI manually
 */
function incrementCounter() {
    globalCount++;
    
    // Update Counter Button Text
    counterBtn.innerText = `Contador: ${globalCount}`;
    
    // Manually sync every box in the DOM to the new state
    // This demonstrates the difficulty of manual sync vs React
    boxes.forEach(box => {
        box.innerText = globalCount;
    });
}

/**
 * Toggles visibility state of a specific box
 */
function toggleBox(targetId) {
    const box = document.getElementById(targetId);
    if (box) {
        // Toggle CSS class 'hidden'
        // This is local state (is visible or not) stored in DOM
        if (box.classList.contains('hidden')) {
            box.classList.remove('hidden');
        } else {
            box.classList.add('hidden');
        }
    }
}

// --- Event Listeners ---

counterBtn.addEventListener('click', incrementCounter);

toggleBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const targetId = btn.getAttribute('data-target');
        toggleBox(targetId);
    });
});
