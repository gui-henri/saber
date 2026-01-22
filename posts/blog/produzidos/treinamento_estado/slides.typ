#set page(
  paper: "presentation-16-9",
  fill: rgb("#1d1f21"), // Dark grey/black background
  margin: 2cm,
)

#set text(
  font: ("JetBrainsMono Nerd Font", "Liberation Mono", "Courier New", "monospace"),
  fill: rgb("#c5c8c6"), // Light grey text
  size: 20pt,
)

// --- Components ---

// Terminal-like block for code or emphasis
#let term(content) = rect(
  fill: rgb("#282a2e"),
  stroke: rgb("#4d4d4d"),
  inset: 1em,
  radius: 4pt,
  width: 100%,
  text(fill: rgb("#b5bd68"), size: 0.9em, content),
)

// Slide title with a prompt style
#let slide_title(text_content) = {
  set text(fill: rgb("#81a2be"), size: 1.4em, weight: "bold")
  text([> #text_content])
  v(1em)
}

// Slide wrapper
#let slide(title: none, content) = {
  if title != none {
    slide_title(title)
  }
  content
  pagebreak()
}

// --- Content ---

// Cover Slide
#align(center + horizon)[
  #text(size: 3em, weight: "bold", fill: rgb("#b5bd68"))[> REACT STATE]

  #v(2em)

  #text(font: "monospace", fill: rgb("#dadada"))[Treinamento de Estado]

  #v(1em)
  #text(size: 0.8em, fill: rgb("#969896"))[gui-henri]
]
#pagebreak()

// Topic 1
// Reduce the title size
#slide(title: "1. O QUE É ESTADO?")[
  #list(marker: text(fill: rgb("#b5bd68"))[>])[
    *Metáfora:* Inglês "To Be" vs "To Stay".
    - *Ser*: Constante (Ex: É humano)
    - *Estar*: Temporário (Ex: Está com fome)

    Em software: *Estado é a informação que varia e descreve o comportamento atual.*
  ]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      *API REST (Stateless)*
      - Não guarda estado entre requests.
      - "toda request é nova".
      - Estado guardado no BD (persiência).
    ],
    [
      *Interface (Stateful)*
      - Dropdown: Aberto/Fechado.
      - Input: Valor digitado.
      - Contador: número atual.
    ],
  )

  #place(bottom + right)[_Ver: exemplo 1_]
]

// Topic 2
#slide(title: "2. HTML & JS VANILLA")[
  Sem framework, o *Estado* e a *UI* são coisas separadas que precisamos sincronizar na mão.

  #term[
    ```javascript
    let count = 0; // O Estado
    const btn = document.querySelector('#btn');
    const display = document.querySelector('#txt');
    btn.onclick = () => {
      count++; // Atualiza estado
      // ⚠️ A UI não sabe que o estado mudou!
      display.innerText = count; // Atualiza UI manualmente
    }
    ```
  ]

  #place(bottom + right)[_Ver: exemplo 2_]
]

// Topic 3
#slide(title: "3. ESTADO NO REACT")[
  O React "reage" a mudanças. O Estado é parte do componente.

  #v(0.5em)

  1. *useState Hook*
  #term[
    ```js
    // [valor, funçãoApontaMudança]
    const [count, setCount] = useState(0);
    ```
  ]

  2. *Imutabilidade*
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    text(fill: rgb("#cc6666"))[`count = 5` \ ❌ Não avisa o React],
    text(fill: rgb("#b5bd68"))[`setCount(5)` \ ✅ Avisa e Re-renderiza],
  )

  3. *Efeitos (Side-effects)*
  `useEffect` permite sincronizar o estado com o mundo exterior (título da página, API, timers).
]

// Topic 4
#slide(title: "4. ESTADO GLOBAL")[
  *Problema:* Passar dados do componente Avô -> Pai -> Filho ("Prop Drilling").

  #v(1em)

  *Solução:* Estado Global.
  Disponível para toda a árvore de componentes.

  - *Context API*: Nativo do React.
  - *Zustand / Redux*: Bibliotecas externas.

  #term[
    ```js
    // Exemplo Zustand
    const useStore = create((set) => ({
      user: null,
      login: (u) => set({ user: u }),
    }))

    // Qualquer componente:
    const user = useStore(state => state.user)
    ```
  ]
]

// Final Slide
#align(center + horizon)[
  #text(size: 2em, fill: rgb("#b5bd68"))[> DÚVIDAS?]
]
