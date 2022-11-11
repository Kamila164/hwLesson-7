import Foundation

//массив с героями
//массив с хп
//массив с атаками (сила удара)


//Воин, Колдун, Медик, Защитник
//У каждого по 1000 ХП изначально (у защитника 1500)
//Каждый раунд наносят удар по 200, 300, 0, 100
//Медик лечит один раз в 2 раунда всю команду на 200 ХП кроме себя самого
//Медик наносить удар не может


//Босс
//5000 ХП изначально
//Наносит по 200 ХП урона каждому игроку в течение игры пока не умрет
//Игра заканчивается когда умирает БОСС и жив хотябы один игрок, либо когда все игроки мертвы, а босс жив
//В конце выводится print - сколько раундов прошло, сколько урона нанес каждый игрок и кто всё-таки стал победителем

//1 раунд
//Герои атакуют
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//(герой) нанес (урон) урона БОССУ. ХП героя - (ХП)
//Босс Атакует
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

//Игроки победили, БОСС мертв
//9 раундов прошло
//Если ХП - 0 (т.е герой умер - делаете принт (Герой) мертв)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)
//ХП героя (героя) - (ХП)

//Функция подсчета жизни
//функция лечения
//Обнулять строку которая выводит //ХП героя (героя) - (ХП)


//for / while

var heroArray: [String] = ["Воин", "Колдун", "Медик", "Защитник"]
var xpArray: [Int] = [1000, 1000, 1000, 1500]
let damageArray: [Int] = [200, 300, 0 ,100]

var boss = "BOSS"
var xpBoss = 5000
var damageBoss = 200

var countRound = 1
var heroIndex = 0
var hero = ""
var damageIndex = 0
var damageHero = 0
var xpIndex = 0
var xpHero = 0

while xpBoss > 0 && xpArray[0] > 0 || xpBoss > 0 && xpArray[1] > 0 || xpBoss > 0 && xpArray[2] > 0 || xpBoss > 0 && xpArray[3] > 0{
    print("Раунд \(countRound)")
    print("")
    
    print("ГЕРОИ АТАКУЮТ")
    for (index,array) in xpArray.enumerated(){
        xpIndex = index
        xpHero = array
        for (index,array) in heroArray.enumerated(){
            heroIndex = index
            hero = array
            for (index,array) in damageArray.enumerated(){
                damageIndex = index
                damageHero = array
                if heroIndex == damageIndex && damageHero > 0 && xpBoss > 0 && xpIndex == heroIndex && xpHero > 0{
                    xpBoss = xpBoss - damageHero
                    print("Герой \(hero) наносит \(damageHero) урона Боссу. XP Босса - \(xpBoss)")
                }
                if xpBoss == 0 {
                    print ("Босс мертв")
                    xpBoss = -1
                }
            }
        }
    }
    
    print("БОСС АТАКУЕТ")
    for (index,array) in xpArray.enumerated(){
        xpIndex = index
        xpHero = array
        for (index,array) in heroArray.enumerated(){
            heroIndex = index
            hero = array
            if heroIndex == xpIndex && xpHero > 0 && xpBoss > 0{
                xpHero = xpHero - damageBoss
                xpArray.remove(at: xpIndex)
                xpArray.insert(xpHero, at: xpIndex)
                print("XP героя \(hero) - \(xpHero)")
                if xpHero == 0 {
                    print("\(hero) мертв")
                }
            }
           
        }
    }
    if countRound % 2 == 0 && xpArray[0] > 0 && xpArray[2] > 0{
        xpArray[0] = xpArray[0] + 200
        print("\(heroArray[2]) лечит \(heroArray[0])")
    }
    if countRound % 2 == 0  && xpArray[1] > 0 && xpArray[2] > 0{
        xpArray[1] = xpArray[1] + 200
        print("\(heroArray[2]) лечит \(heroArray[1])")
    }
    if countRound % 2 == 0 && xpArray[3] > 0 && xpArray[2] > 0{
        xpArray[3] = xpArray[3] + 200
        print("\(heroArray[2]) лечит \(heroArray[3])")
    }
    
    
    print("")
    countRound += 1
}

if xpBoss > 0{
    print("БОСС ПОБЕДИЛ, ИГРОКИ МЕРТВЫ. \nПрошло \(countRound) раундов")
}else{
    print("ИГРОКИ ПОБЕДИЛИ, БОСС МЕРТВ. \nПрошло \(countRound) раундов")
}

