//
//  ViewController.swift
//  TableView_2
//
//  Created by 박규빈 on 2023/02/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var studentTableView: UITableView!
    
    // MARK: - Properties -
    let sectionList: [String] = ["김", "이", "박", "최"]
    var people: [(name: String, age: Int)] = [("김민준", 10), ("이서준", 20), ("박도윤", 21), ("김예준", 14), ("이하준", 18), ("최주원", 25), ("최지호", 9), ("박준우", 12), ("이하윤", 22), ("김민서", 11)]
    
    // MARK: - View Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentTableView.delegate = self
        studentTableView.dataSource = self
        
    }
    // MARK: - Delegate & DataSource -
    //numberOfRowsInSection에서는 section마다 표현될 row의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //section에 들어갈 성씨 별 개수
        if section == 0 {
            //성이 김씨만 추출
            let kims = people.filter { person in
                person.name.first == "김"
            }
            return kims.count
        } else if section == 1 {
            //성이 이씨만 추출
            let lees = people.filter { person in
                person.name.first == "이"
            }
            return lees.count
        } else if section == 2 {
            //성이 박씨만 추출
            let parks = people.filter { person in
                person.name.first == "박"
            }
            return parks.count
        } else if section == 3 {
            //성이 최씨만 추출
            let choi = people.filter { person in
                person.name.first == "최"
            }
            return choi.count
        } else {
            return 0
        }
    }
    
    //numberOfSections에서는 표현될 section의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    //titleForHeaderInSection에서는 section마다 표현될 title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "studentTableViewCell", for: indexPath) as? StudentTableViewCell else { return UITableViewCell() }
        
        //people 나이 정렬
        let peopleAgeSorted = people.sorted { $0.age < $1.age }
        

//        //MARK: -
        
        //각 section안의 row값 입력
        if indexPath.section == 0 {
            let kims = peopleAgeSorted.filter { person in
                person.name.first == "김"
            }
            cell.nameLabel.text = "이름 : \(kims[indexPath.row].name)"
            cell.ageLabel.text = "나이 : \(kims[indexPath.row].age) 세"
        } else if indexPath.section == 1 {
            let lees = peopleAgeSorted.filter { person in
                person.name.first == "이"
            }
            cell.nameLabel.text = "이름 : \(lees[indexPath.row].name)"
            cell.ageLabel.text = "나이 : \(lees[indexPath.row].age) 세"
        } else if indexPath.section == 2 {
            let parks = peopleAgeSorted.filter { person in
                person.name.first == "박"
            }
            cell.nameLabel.text = "이름 : \(parks[indexPath.row].name)"
            cell.ageLabel.text = "나이 : \(parks[indexPath.row].age) 세"
        } else if indexPath.section == 3 {
            let choi = peopleAgeSorted.filter { person in
                person.name.first == "최"
            }
            cell.nameLabel.text = "이름 : \(choi[indexPath.row].name)"
            cell.ageLabel.text = "나이 : \(choi[indexPath.row].age) 세"
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
//didSelectRowAt에서는 선택된 indexPath에 대한 처리
