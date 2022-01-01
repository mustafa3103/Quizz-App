//
//  QuizBrain.swift
//  quizApp
//
//  Created by Mustafa on 27.12.2021.
//

import Foundation

struct QuizBrain {
    
    var selectedQ = ""
    var selectedA = Answer(first: "", second: "", third: "", fourth: "")
    var selectedC = ""
    
    
    var easyQuestion = [Question(q: "Hangi gezegende yaşıyoruz ?", a: ["Mars","Dünya","Ay","Satürn"], correctAnswer: "Dünya"), Question(q: "Dünyanın en büyük okyanusu hangisidir ?", a: ["Pasifik Okyanusu", "Hint Okyanusu", "Atlas Okyanusu", "Güney Okyanusu"], correctAnswer: "Pasifik Okyanusu"), Question(q: "Arapların kullanmış olduğu alfabe hangi yönde okunmaktadır ?", a: ["Yukarıdan aşağı", "Sağdan sola", "Soldan sağa", "Aşağıdan yukarı"], correctAnswer: "Sağdan sola"), Question(q: "Tiyatroda kendi kendine konuşma olarak bilinen türün adı nedir ?", a: ["Analog", "Monolog", "Dialog", "Triolog"], correctAnswer: "Monolog"), Question(q: "Depremin büyüklüğünü ve süresini ölçen alete ne ad verilir ?", a: ["Sismograf", "Anemometre", "Speed", "Spectrometer"], correctAnswer: "Sismograf"), Question(q: "Yazları sıcak ve kurak; kışları ise soğuk ve karlı geçen bir bölgede aşağıdaki iklimlerden hangisi görülür ?", a: ["Tundra", "Kırsal iklim", "Karasal iklim", "Muson iklimi"], correctAnswer: "Karasal iklim"), Question(q: "Yerden fışkırarak çıkan sıcak su kaynaklarına ne denir ?", a: ["Allahın hikmeti", "Gayzer", "Lav", "Alev topu"], correctAnswer: "Gayzer"), Question(q: "Aşağıdaki balık türlerinden hangisi memelidir ?", a: ["Hamsi", "Zargana", "Enez Yılmaz", "Balina"], correctAnswer: "Balina"), Question(q: "Köylülerin el birliği ile köyün işini birlikte yapmalarına ne ad verilir ?", a: ["Tutunma" ,"Kuşatma", "İmece", "Tutulma"], correctAnswer: "İmece"), Question(q: "Türkiye'yi ağaçlandırmak ve erozyonla mücadele etmek olan kurulan Sivil Toplum Kuruluşu, aşağıdakilerden hangisidir ?", a: ["Tügva", "P&G", "TEMA", "Hayır kurumları"], correctAnswer: "TEMA"), Question(q: "Hangisi sürüngen hayvan değildir ?", a: ["Yılan", "Anakonda", "Kertenkele", "İnek"], correctAnswer: "İnek"), Question(q: "Türkçe hangi dil grubuna girmektedir ?", a: ["Hami-sami dilleri", "Çin-tibet dilleri", "Tek heceleri Diller", "Ural-altay Dilleri"], correctAnswer: "Ural-altay Dilleri")]
    var mediumQuestion = [Question(q: "Aspirinin ilk kez çıkış yılı nedir ?", a: ["1880", "1930", "1910", "1899"], correctAnswer: "1899"), Question(q: "Türk ordusunun ve Türk Kara Kuvvetlerinin kuruluşu hangi yıl kabul edilir ?", a: ["1900", "1453", "1238", "MÖ:309"], correctAnswer: "MÖ:309"), Question(q: "Kuyucaklı Yusuf adlı eser kime aittir ?", a: ["Sabahattin Ali", "Yusuf Atılgan", "Ziya Gökalp", "Gogol"], correctAnswer: "Sabahattin Ali"), Question(q: "“Sinekli Bakkal” Romanının Yazarı Aşağıdakilerden Hangisidir ?", a: ["Halide Edip Adıvar", "Reşat Nuri", "Ziya Gökalp", "Ömer seyfettin"], correctAnswer: "Halide Edip Adıvar"), Question(q: "Aşağıda Verilen İlk Çağ Uygarlıklarından Hangisi Yazıyı İcat Etmiştir ?", a: ["Hitiler", "Elamlar", "Sümerler", "Urartular"], correctAnswer: "Sümerler"), Question(q: "Tsunami Felaketinde En Fazla Zarar Gören Güney Asya Ülkesi Aşağıdakilerden Hangisidir ?", a: ["Endonezya", "Çin", "Japonya", "Hindistan"], correctAnswer: "Endonezya"), Question(q: "2003 Yılında Euro Vizyon Şarkı Yarışmasında Ülkemizi Temsil Eden ve Yarışmada Birinci Gelen Sanatçımız Kimdir ?", a: ["Athena", "Sertap Erener", "Ajda Pekkan", "Manga"], correctAnswer: "Sertap Erener")]
    var hardQuestion = [Question(q: "Gövdesi sarı veya kirli sarı; yelesi, kuyruğu ve bacağının alt kısmındaki kılları koyu renkte olan atlar içi kullanılan ifade hangisidir ?", a: ["Doru", "Kula", "Yağız", "Seki"], correctAnswer: "Kula"), Question(q: "Abd başkanlarının besledikleri resmi hayvanlar arasında hangisi yoktur ?", a: ["Muhabbet Kuşu", "Zürafa","Sırtlan", "Su aygırı"], correctAnswer: "Zürafa"), Question(q: "Başta kanada olmak üzere 17. ve 18. yüzyıllarda birçok fransız kolonisinde hangisi para olarak kullanışmıştır ?", a: ["Posta pulu", "Bitki Tohumu", "İskambil Kağıdı", "Cam Boncuk"], correctAnswer: "İskambil Kağıdı"), Question(q: "Harikalar diyarındaki maceraları ile tanınan Alice’in en büyük düşmanı olan kraliçe, i̇skambilde hangi kart grubuna mensuptur ?", a: ["Kupa", "Maça", "Karo", "Sinek"], correctAnswer: "Maça"), Question(q: "Afrika'daki hangi iki hayvan, birinin görüş diğerinin koku alma yeteneği üstün olduğu için tehlikelerden korunmak adına birlikte otlarlar ?", a: ["Su aygırı ve Ceylan", "Fil ve Zürafa", "Antilop ve gergedan", "Devekuşu ve Zebra"], correctAnswer: "Devekuşu ve Zebra")]
    
    
    
    mutating func getQuestionText(number: Int) {
        
        
        
        if number < 3 {
            let randomNumber = Int.random(in: 0 ... easyQuestion.count - 1)
            selectedQ = easyQuestion[randomNumber].text
            selectedA = Answer(first: easyQuestion[randomNumber].answer[0], second: easyQuestion[randomNumber].answer[1], third: easyQuestion[randomNumber].answer[2], fourth: easyQuestion[randomNumber].answer[3])
            selectedC = easyQuestion[randomNumber].cAnswer
            easyQuestion.remove(at: randomNumber)
            
        }else if number < 7 {
            let randomNumber = Int.random(in: 0 ... mediumQuestion.count - 1)
            selectedQ = mediumQuestion[randomNumber].text
            selectedA = Answer(first: mediumQuestion[randomNumber].answer[0], second: mediumQuestion[randomNumber].answer[1], third: mediumQuestion[randomNumber].answer[2], fourth: mediumQuestion[randomNumber].answer[3])
            selectedC = mediumQuestion[randomNumber].cAnswer
            mediumQuestion.remove(at: randomNumber)
            
        }else {
            let randomNumber = Int.random(in: 0 ... hardQuestion.count - 1)
            selectedQ = hardQuestion[randomNumber].text
            selectedA = Answer(first: hardQuestion[randomNumber].answer[0], second: hardQuestion[randomNumber].answer[1], third: hardQuestion[randomNumber].answer[2], fourth: hardQuestion[randomNumber].answer[3])
            selectedC = hardQuestion[randomNumber].cAnswer
            hardQuestion.remove(at: randomNumber)
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
