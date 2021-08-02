'use strict';

// Программа "Умножатель" - v.1.0
// Помогает проверять таблицу умножения.
// Первый вариант — тестирование по столбикам, в разнобой.

let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

const column = +prompt('Столбик на какую цифру будем проверять?');

function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
  }
}

shuffleArray(numbers);

let score = 0;

for (let i = 0; i < 11; i++) {
  let multiplier = numbers[i];

  let rightAnswer = column * multiplier;

  let userAnswer = +prompt(`Сколько будет ${column} * ${multiplier}?`);

  let message =
    userAnswer === rightAnswer ? '👍 Правильно' : `👎 Неправильно, верный ответ ${rightAnswer}`;

  if (userAnswer === rightAnswer) {
    score ++;
  }

  alert(message);
}

alert(`Ты дал правильных ответов на вопросы: ${score}`);
