# VHDL — Anotações de Aula

## Conceito Geral

- VHDL significa **VHSIC (Very High Speed Integrated Circuits) Hardware Description Language**
- Permite descrever em software o comportamento e a estrutura de hardware de sistemas digitais
- Utilizado para modelagem e implementação de circuitos digitais

---

# Síntese

- Processo de tradução do código VHDL para uma estrutura de hardware
- Implementação do circuito em FPGA
- Transferência do código desenvolvido para o hardware físico

---

# FPGA

## FPGA (Field Programmable Gate Array)

- Placa composta por:
  - portas lógicas
  - elementos de memória (Flip-Flops)
- Estrutura organizada em forma matricial
- Pode ser programada para implementar diferentes circuitos digitais

---

# Observações sobre VHDL

- Não é *case-sensitive*
- Comentários:

```vhdl
-- comentário
```

- Atribuição de sinais:

```vhdl
A <= B;
```

- Operações booleanas:

```vhdl
AND, OR, NOT, XOR
```

---

# Entity

## Conceito

- Define as entradas e saídas do sistema digital
- Representa a interface do circuito

---

## Sintaxe

```vhdl
ENTITY entity_name IS
    GENERIC (
        constant_name : constant_type := constant_value;
    );

    PORT (
        port_name : signal_mode signal_type;
    );
END entity_name;
```

---

## Componentes

### entity_name

- Nome da entidade/modelo

### GENERIC

- Define constantes genéricas
- Valores podem ser alterados posteriormente
- Pode ser utilizado dentro de `PORT`

### PORT

- Declara as entradas e saídas do circuito

---

# Modos de PORT

## IN

- Dados entram na entidade
- Exemplos:
  - clock
  - dados de entrada
  - sinais de controle

## OUT

- Dados saem da entidade

## BUFFER

- Saída que também pode ser lida internamente

## INOUT

- Entrada e saída no mesmo sinal

---

# Tipos de sinais

## BIT / BIT_VECTOR

- Representam níveis lógicos
- Valores possíveis:

```vhdl
'0' ou '1'
```

### Observações

- Tipos nativos do VHDL
- Não precisam de bibliotecas adicionais

---

## STD_LOGIC / STD_LOGIC_VECTOR

- Representam níveis lógicos mais completos

### Valores possíveis

```vhdl
'0', '1', '-', 'Z'
```

- `-` → don't care
- `Z` → alta impedância

### Bibliotecas necessárias

```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
```

---

# CONSTANT

## Conceito

- Define valores constantes

## Sintaxe

```vhdl
constant_name : constant_type := constant_value;
```

## Exemplo

```vhdl
n_bits : INTEGER := 16;
```

---

# SIGNAL

## Conceito

- Utilizado para transmitir dados:
  - entre componentes
  - dentro da entidade
  - entre entradas e saídas

- Atua como fios do circuito
- Pode armazenar valores temporários

---

# VARIABLE

## Conceito

- Armazena valores em partes sequenciais do código VHDL

---

# Operadores

## Operadores de atribuição

### `<=`

- Usado para sinais (`SIGNAL`)

```vhdl
A <= B;
```

### `:=`

- Usado para:
  - constantes
  - variáveis

```vhdl
x := 10;
```

---

# Operadores de concatenação

## Operadores

```vhdl
&
,
```

## Exemplo

```vhdl
k : CONSTANT BIT_VECTOR(1 TO 4) := "1100";

x <= ('Z', k(2 TO 3), "11111");
```

Resultado:

```vhdl
x <= 'Z1011111';
```

Forma equivalente:

```vhdl
x <= 'Z' & k(2 TO 3) & "11111";
```

---

# Operadores lógicos

## Operadores disponíveis

```vhdl
NOT
AND
NAND
OR
NOR
XOR
XNOR
```

## Exemplos

```vhdl
x <= a NAND b;
```

```vhdl
y <= NOT (a AND b);
```

```vhdl
z <= NOT a AND b;
```

---

# Operadores aritméticos

## Operadores disponíveis

```vhdl
+
-
*
/
**
ABS
REM
MOD
```

## Exemplos

```vhdl
x <= (a + b)**N;
```

```vhdl
y <= ABS(a) + ABS(b);
```

```vhdl
z <= a/(a + b);
```

---

# Operadores de deslocamento

## SLL — Shift Left Logical

- Desloca bits para a esquerda
- Preenche com `0`

## SRL — Shift Right Logical

- Desloca bits para a direita
- Preenche com `0`

## SLA — Shift Left Arithmetic

- Desloca bits para a esquerda
- Preenche utilizando o bit da direita

## SRA — Shift Right Arithmetic

- Desloca bits para a direita
- Preenche utilizando o bit da esquerda

## ROL — Rotate Left

- Rotação circular para a esquerda

## ROR — Rotate Right

- Rotação circular para a direita