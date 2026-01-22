
import curses

def main(stdscr):
    # Clear screen
    stdscr.clear()
    
    # Hide cursor
    curses.curs_set(0)
    
    # Initialize state
    # state = False -> "Olá"
    # state = True  -> "Mundo"
    is_mundo = False
    
    stdscr.addstr(0, 0, "Pressione ESPAÇO para mudar o estado (ou 'q' para sair)")

    while True:
        # Determine text based on state
        text = "Mundo" if is_mundo else "Olá"
        
        # Display current state
        # Center the text effectively
        height, width = stdscr.getmaxyx()
        x = width // 2 - len(text) // 2
        y = height // 2
        
        # Clear the line to avoid artifacts
        stdscr.move(y, 0)
        stdscr.clrtoeol()
        
        stdscr.addstr(y, x, text, curses.A_BOLD)
        stdscr.refresh()
        
        # Wait for input
        key = stdscr.getch()
        
        if key == ord(' '):
            # Toggle state
            is_mundo = not is_mundo
        elif key == ord('q'):
            break

if __name__ == "__main__":
    curses.wrapper(main)
