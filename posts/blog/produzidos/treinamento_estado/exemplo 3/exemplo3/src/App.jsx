import React from 'react';
import { SquareButton } from './components/SquareButton';
import { CounterButton } from './components/CounterButton';
import './App.css';
// We will reuse the style logic, but updated for React hierarchy if needed.
// For now, assume standard global CSS import or we might need to copy over the CSS.

function App() {
  return (
    <div className="container">
      <h1>Gerenciamento de Estado no React</h1>

      <CounterButton />

      <div className="grid">
        <SquareButton label="Toggle 1" />
        <SquareButton label="Toggle 2" />
        <SquareButton label="Toggle 3" />
      </div>
    </div>
  );
}

export default App;
