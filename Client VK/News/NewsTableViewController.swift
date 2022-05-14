//
//  NewsTableViewController.swift
//  Client VK
//
//  Created by Максим Борисенко on 25.04.2022.
//  Copyright © 2022 Maxim Borisenko. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsList = [
        PostNewsStruct(name: "Jailbreak PS4/PS5. Все о прошивке Playstation", avatar: UIImage(named: "person1"), date: "Вчера в 20:00", textNews: "[PS4|HEN] Orbis-Suite-3.0 - следующая версия Orbis Suite полностью переписана с новым графическим интерфейсом. Теперь его можно запускать через хоумбрю приложение и отпала необходимость в пейлоад (полезной нагрузке)! Полнофункциональный набор инструментов, помогающих в разработке и отладке на консоли PS4.", textImage: UIImage(named: "news1")),
        PostNewsStruct(name: "ЯЖЕБАТЯ", avatar: UIImage(named: "person2"), date: "14.04.2022 в 15:10", textNews: "Генеральная репетиция Парада в Москве завершилась.По Красной площади в составе механизированной колонны прошёл парадный расчёт участников спецоперации по защите Донбасса.⭐ Всего в параде в честь 77-летия Победы примут участие около 11 тысяч военнослужащих, а также будут задействованы 131 единица современного вооружения и военной техники, 77 самолётов и вертолётов.", textImage: UIImage(named: "news2")),
        PostNewsStruct(name: "Clash of Clans: Мифы и Факты", avatar: UIImage(named: "person3"), date: "27.03.2022 в 19:19", textNews: "Как видите, активность в паблике резко упала. К сожалению, нет желаемого времени, которое я бы мог отводить паблику, как это было раньше, как и нет мотивации к его развитию. Посты собирают все меньше лайков, а количество недовольства по тому или иному поводу повышается.Паблик существует уже более 7 лет. Когда я его создавал - мне было 19 и я был беззаботным студентом, а сейчас - мне уже 26 и забот поприбвилось. В подробности, конечно, вдаваться не будем - просто выросла социальная отвественность и появилось много вопросов, связанных с работой и бытом, которые необходимо решать. Нет уверенности в том, что паблик будет работать и дальше, однако, окончательного решения я еще не принял. Скажем так - этим постом я замараживаю паблик. Временно или постоянно - покажут ближайшие месяцы. Буду держать в курсе.Спасибо за внимание!", textImage: UIImage(named: "news3"))
    ]


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        
        // аватар
        cell.avatarUserNews.avatarImage.image = newsList[indexPath.row].avatar
        // имя автора
        cell.nameUserNews.text = newsList[indexPath.row].name
        // дата новости
        cell.dateNews.text = newsList[indexPath.row].date
        cell.dateNews.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        cell.dateNews.textColor = UIColor.gray.withAlphaComponent(0.5)
        //текст новости
        cell.textNews.text = newsList[indexPath.row].textNews
        cell.textNews.numberOfLines = 0
        //картинка к новости
        cell.imgNews.image = newsList[indexPath.row].textImage
        cell.imgNews.contentMode = .scaleAspectFill

        return cell
    }

}
