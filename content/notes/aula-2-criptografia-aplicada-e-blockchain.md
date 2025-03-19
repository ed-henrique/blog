+++
date = '2025-03-19T16:15:41-04:00'
draft = false
title = 'Notas da Aula 2 - Criptografia Aplicada e Blockchain'
+++

## Instituições Relevantes

- NIST
- Global Risk Institute

## Publicações Relevantes

- [Status Report on the Fourth Round of the NIST Post-Quantum Cryptography Standardization 
  Process](https://csrc.nist.gov/pubs/ir/8545/final)
  - [Quantum Threat Timeline Report 2024](https://globalriskinstitute.org/publication/2024-quantum-threat-timeline-report/)

## Tópicos Interessantes

- [Hipótese de Riemann](https://pt.wikipedia.org/wiki/Hip%C3%B3tese_de_Riemann)

Entender se uma mensagem foi modificada por meios de *hashes*, realizando o *hash* do arquivo 
original e o *hash* do arquivo recebido.

É importante ter o *hash* porque o custo de armazenamento do arquivo original é um problema. Além 
disso, é necessário ter o original para conferir. Não só isso, mas se ele ficar mudando toda hora, 
isso gera um problema para tratar do versionamento do arquivo.

Uma função de *hash* recebe como entrada uma mensagem dm de tamanho variável e produz uma saída H(M) 
de tamanho fixo. A saída da função de *hash* também é chamada de *hash*. Elas são conhecidas como 
funções de caminho único, pois não é possível derivar a entrada da saída. Com uma mudança mínima na 
entrada, a saída deve mudar muito (efeito avalanche). A função é pública.

- [Blockchain 101 - A Visual Demo](https://www.youtube.com/watch?v=_160oMzblY8)

A função usada em criptografia é uma função de *hash* criptográfica, por possuir requisitos de 
segurança específicos. Ela gera um "resumo" do dado. O *hash* deve ser armazenado em local seguro 
para garantir a segurança da comparação.

- [SHAttered](https://shattered.io/)

### Requisitos de Segurança de uma Função de Hash Criptográfica

- Tamanho de entrada variável e de saída fixo
- Fácil de computar para qualquer entrada
- Resistência à pré-imagem: dado H(x), é inviável achar x
- Resistência à segunda pré-imagem: dados x e H(x), é inviável encontrar y =/= x com H(x) = H(y)
- Resistência à colisão: inviável achar dois valores x =/= y com H(x) = H(y)
- Saída passa nos testes de pseudo-aleatoriedade

### Segurança das Funções de Hash

- Ataque de força bruta: depende apenas do tamanho da saída da função, e não do algoritmo
- Assuma uma função H com saída de m bits
- Para encontrar x dado h = H(x), o esforço é proporcional a 2^m tentativas
    - Em média, 2^(m-1) (metade das possibilidades)
    - Primeira e segunda pré-imagens
- Para encontrar dois valores diferentes x e y tal que H(x) = H(y), precisamos de um esforço muito 
  menor, graças ao paradoxo do aniversário
    - De apenas 2^(m/2) tentativas

- [Paradoxo do Aniversário](https://pt.wikipedia.org/wiki/Paradoxo_do_anivers%C3%A1rio)
- [Princípio da Casa dos Pombos](https://pt.wikipedia.org/wiki/Princ%C3%ADpio_da_casa_dos_pombos)
- Secure Hash Standard (SHS)
    - Ver FIPS PUB 180-4

### Aplicações Práticas

- Autenticação de mensagens
- Assinatura digital
- Armazenamento seguro de senhas
- Geração de números pseudo-aleatórios (geração de parâmetros e chaves)
- Imutabilidade de registros em uma *blockchain*
- Esquemas de comprometimento
