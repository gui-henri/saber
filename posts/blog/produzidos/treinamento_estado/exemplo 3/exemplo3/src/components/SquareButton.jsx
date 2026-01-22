import { useState } from 'react';
import { useStore } from '../store';

export function SquareButton({ label }) {
    const [isVisible, setIsVisible] = useState(false);
    const count = useStore((state) => state.count);

    return (
        <div className="row">
            <button className="toggle-btn" onClick={() => setIsVisible(!isVisible)}>
                {label}
            </button>

            {/* 
        In React, we don't need to manually add/remove classes for visibility 
        if we don't want to. We can conditionally render.
        However, to match the "CSS transition" effect of Exemplo 2, 
        we will toggle the class.
      */}
            <div className={`box ${!isVisible ? 'hidden' : ''}`}>
                {count}
            </div>
        </div>
    );
}
