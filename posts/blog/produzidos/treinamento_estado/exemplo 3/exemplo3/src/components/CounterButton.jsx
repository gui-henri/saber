import { useStore } from '../store';

export function CounterButton() {
    const count = useStore((state) => state.count);
    const increment = useStore((state) => state.increment);

    return (
        <div className="controls">
            <button id="counter-btn" onClick={increment}>
                Contador: {count}
            </button>
        </div>
    );
}
