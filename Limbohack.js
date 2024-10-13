    function createGUI() {
        const container = document.createElement('div');
        container.style.position = 'fixed';
        container.style.top = '50%';
        container.style.left = '50%';
        container.style.transform = 'translate(-50%, -50%)';
        container.style.background = 'black';
        container.style.border = '2px solid purple';
        container.style.padding = '20px';
        container.style.borderRadius = '10px';
        container.style.zIndex = '9999';
        container.style.color = 'purple';
        container.style.fontFamily = 'Arial, sans-serif';
        container.style.width = '300px';
        container.style.textAlign = 'center';
        container.style.cursor = 'move';  // Mostra o ícone de mover

        // Chama a função de tornar a GUI arrastável
        makeDraggable(container);

        // Título
        const title = document.createElement('h2');
        title.innerText = 'Digite a Key';
        title.style.color = 'purple';
        title.style.fontFamily = 'Tahoma, Geneva, sans-serif';
        container.appendChild(title);

        // Campo de input para a Key (agora tipo password para censurar)
        const input = document.createElement('input');
        input.type = 'password'; // Censura a key digitada
        input.placeholder = 'Insira a Key...';
        input.style.width = '90%';
        input.style.padding = '10px';
        input.style.marginBottom = '20px';
        input.style.borderRadius = '5px';
        input.style.border = '1px solid purple';
        input.style.background = 'black';
        input.style.color = 'purple';
        container.appendChild(input);

        // Botão para verificar a Key
        const submitButton = document.createElement('button');
        submitButton.innerText = 'Entrar';
        submitButton.style.padding = '10px 20px';
        submitButton.style.background = 'purple';
        submitButton.style.color = 'white';
        submitButton.style.border = 'none';
        submitButton.style.borderRadius = '5px';
        submitButton.style.cursor = 'pointer';
        submitButton.addEventListener('click', function() {
            if (input.value === 'demolimbo!JINXED') {
                container.remove();
                createTable();
            } else {
                alert('Key incorreta!');
            }
        });
        container.appendChild(submitButton);

        document.body.appendChild(container);
    }

    // Função para criar a tabela de botões
    function createTable() {
        const tableContainer = document.createElement('div');
        tableContainer.style.position = 'fixed';
        tableContainer.style.top = '50%';
        tableContainer.style.left = '50%';
        tableContainer.style.transform = 'translate(-50%, -50%)';
        tableContainer.style.background = 'black';
        tableContainer.style.border = '2px solid purple';
        tableContainer.style.padding = '20px';
        tableContainer.style.borderRadius = '10px';
        tableContainer.style.zIndex = '9999';
        tableContainer.style.color = 'purple';
        tableContainer.style.fontFamily = 'Arial, sans-serif';
        tableContainer.style.width = '300px';
        tableContainer.style.textAlign = 'center';
        tableContainer.style.cursor = 'move';  // Mostra o ícone de mover

        // Chama a função de tornar a tabela movível
        makeDraggable(tableContainer);

        // Tabela com botões
        const table = document.createElement('table');
        table.style.width = '100%';

        const buttonLabels = ['1000x', '999x', '10x'];
        const functions = [
            function() { alert('Script 1000x Executado!'); },
            function() { alert('Script 999x Executado!'); },
            function() { alert('Script 10x Executado!'); }
        ];

        for (let i = 0; i < buttonLabels.length; i++) {
            const row = document.createElement('tr');
            const cell = document.createElement('td');
            const button = document.createElement('button');

            button.innerText = buttonLabels[i];
            button.style.padding = '10px 20px';
            button.style.background = 'purple';
            button.style.color = 'white';
            button.style.border = 'none';
            button.style.borderRadius = '5px';
            button.style.cursor = 'pointer';
            button.style.margin = '10px 0';

            button.addEventListener('click', functions[i]);

            cell.appendChild(button);
            row.appendChild(cell);
            table.appendChild(row);
        }

        tableContainer.appendChild(table);

        // Rodapé
        const footer = document.createElement('p');
        footer.innerText = 'Made by ! JINXED / Feito Pelo ! JINXED';
        footer.style.color = 'purple';
        footer.style.marginTop = '20px';
        footer.style.fontSize = '12px';
        tableContainer.appendChild(footer);

        document.body.appendChild(tableContainer);
    }

    // Função para tornar os elementos arrastáveis
    function makeDraggable(element) {
        let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;

        element.onmousedown = dragMouseDown;

        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            // Posição inicial do mouse
            pos3 = e.clientX;
            pos4 = e.clientY;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            // Calcula o novo cursor de posição
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            // Define a nova posição do elemento
            element.style.top = (element.offsetTop - pos2) + "px";
            element.style.left = (element.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            // Para de mover o elemento quando o mouse é solto
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }

    // Iniciar a GUI
    createGUI();
})();
