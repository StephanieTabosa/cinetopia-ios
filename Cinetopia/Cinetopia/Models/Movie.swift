//
//  Movie.swift
//  Cinetopia
//
//  Created by Stèphanie Tabosa on 11/04/24.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseDate: String
}

let movies: [Movie] = [
    Movie(id: 1, title: "007 - Sem Tempo para Morrer", image: "007", synopsis: "James Bond deixa o MI6 e se muda para a Jamaica, mas um antigo amigo aparece e pede sua ajuda para encontrar um cientista desaparecido. Bond mergulha no caso e percebe que a busca é, na verdade, uma corrida para salvar o mundo.",
        rate: 7.4, releaseDate: "30/09/2021"),
    Movie(id: 2, title: "Barbie", image: "barbie", synopsis: "Depois de ser expulsa da Barbieland por ser uma boneca de aparência menos do que perfeita, Barbie parte para o mundo humano em busca da verdadeira felicidade.", rate: 7.5, releaseDate: "20/07/2023"),
    Movie(id: 3, title: "Halloween", image: "halloween", synopsis: "Quatro década depois de escapar do ataque de Michael Myers em uma noite de Halloween, Laurie Strode precisa confrontar o assassino mascarado mais uma vez após ele escapar de uma instituição. Mas, agora Laurie está preparada.", rate: 8.1, releaseDate: "25/10/2018"),
    Movie(id: 4, title: "O Estranho Mundo de Jack", image: "jack", synopsis: "Jack Skellington, o Rei das Abóboras, se cansa de fazer o Dia das Bruxas todos os anos e deixa os limites da cidade. Por acaso, acaba atravessando o portal do Natal, onde vê a alegria do espírito natalino. Ao retornar para a Cidade do Halloween, sem ter compreendido o que viu, ele começa a convencer os cidadãos a sequestrarem o Papai Noel e fazerem seu próprio Natal. Apesar de sua leal namorada Sally ser contra, o Papai Noel é capturado e os fatos mostrarão que Sally estava certa o tempo todo.", rate: 9.0, releaseDate: "24/12/1993")
]
