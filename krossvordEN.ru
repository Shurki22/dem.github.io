<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Year Crossword</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f3ff;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #c2185b;
            margin-bottom: 15px;
        }
        .crossword-container {
            display: inline-block;
            margin: 20px auto;
            background-color: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(10, 32px);
            grid-template-rows: repeat(10, 32px);
            gap: 1px;
            border: 2px solid #333;
        }
        .cell {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 16px;
            border: 1px solid #aaa;
            background-color: #fff;
            position: relative;
        }
        .filled {
            background-color: #f0f0f0;
        }
        .number {
            position: absolute;
            top: 1px;
            left: 2px;
            font-size: 9px;
            color: #666;
        }
        .clues {
            max-width: 500px;
            margin: 25px auto;
            padding: 15px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            text-align: left;
        }
        .clues h2 {
            color: #1976d2;
            border-bottom: 2px solid #1976d2;
            padding-bottom: 5px;
        }
        .clue-list {
            padding-left: 20px;
        }
        .clue-list li {
            margin: 6px 0;
        }
    </style>
</head>
<body>
    <h1>🎄 New Year Crossword 🎄</h1>

    <div class="crossword-container">
        <div class="grid" id="crossword-grid"></div>
    </div>

    <div class="clues">
        <h2>Clues:</h2>
        <h3>Across:</h3>
        <ol class="clue-list">
            <li>New Year decoration that stands in the living room.</li>
            <li>He brings presents on Christmas Eve — jolly and red-suited.</li>
            <li>White flakes that fall from the sky in winter.</li>
        </ol>

        <h3>Down:</h3>
        <ol class="clue-list" start="4">
            <li>Another word for a present.</li>
            <li>A French Christmas greeting — "Joyeux ___!"</li>
        </ol>
    </div>

    <script>
        // Инициализация пустой сетки 10x10
        const size = 10;
        let grid = Array(size).fill().map(() => Array(size).fill(' '));
        let numbers = Array(size).fill().map(() => Array(size).fill(''));

        // Слова и их позиции (row, col, direction: 'H' или 'V', number)
        const words = [
            { word: "TREE",     row: 0, col: 2, dir: "H", num: 1 },
            { word: "SANTA",    row: 2, col: 1, dir: "H", num: 2 },
            { word: "SNOW",     row: 4, col: 3, dir: "H", num: 3 },
            { word: "GIFT",     row: 0, col: 4, dir: "V", num: 4 },
            { word: "NOEL",     row: 3, col: 5, dir: "V", num: 5 }
        ];

        // Заполняем сетку буквами и номерами
        words.forEach(w => {
            for (let i = 0; i < w.word.length; i++) {
                if (w.dir === "H") {
                    grid[w.row][w.col + i] = w.word[i];
                    if (i === 0) numbers[w.row][w.col + i] = w.num;
                } else if (w.dir === "V") {
                    grid[w.row + i][w.col] = w.word[i];
                    if (i === 0) numbers[w.row + i][w.col] = w.num;
                }
            }
        });

        // Рендер сетки
        const gridEl = document.getElementById('crossword-grid');
        for (let r = 0; r < size; r++) {
            for (let c = 0; c < size; c++) {
                const cell = document.createElement('div');
                cell.className = 'cell';
                if (grid[r][c] !== ' ') {
                    cell.classList.add('filled');
                    let content = `<span class="letter">${grid[r][c]}</span>`;
                    if (numbers[r][c]) {
                        content = `<span class="number">${numbers[r][c]}</span>${content}`;
                    }
                    cell.innerHTML = content;
                }
                gridEl.appendChild(cell);
            }
        }
    </script>
</body>
</html>
