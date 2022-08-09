//
//  ViewController.swift
//  DreamPJ_SchoolFoodGuide
//
//  Created by 이태형 on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    var resetValue = false
    var walletMoney = 0
    var payMoney = 0
    let imageArr = ["kimbob", "bibimbob", "noodle", "riceCake"]
    let nameArr = ["스페셜마리", "불맛 중화비빔밥", "어간장 육감쫄면", "의성 마늘떡볶이"]
    let priceArr = [7500, 8500, 8000, 9000]
    
    lazy var tableView = UITableView()
    lazy var resetBtn = UIButton()
    lazy var walletLabel = UILabel()
    lazy var payLabel = UILabel()
    lazy var numberFomatter = NumberFormatter()
    
//MARK: - LC
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        navigationItem.titleView = imageView
        let chargeItem = UIBarButtonItem(title: "충전", style: .plain, target: self, action: #selector(chargeItemClicked))
        navigationItem.leftBarButtonItem = chargeItem
        let paymentItem = UIBarButtonItem(title: "결제", style: .plain, target: self, action: #selector(paymentItemClicked))
        navigationItem.rightBarButtonItem = paymentItem
        
        let moneyView = UIView()
        let labelOne = UILabel()
        let labelTwo = UILabel()
        let labelStack = UIStackView(arrangedSubviews: [labelOne, labelTwo])
        let moneyStack = UIStackView(arrangedSubviews: [walletLabel, payLabel])
        let payStack = UIStackView(arrangedSubviews: [labelStack, moneyStack])
        
        view.addSubview(tableView)
        view.addSubview(resetBtn)
        view.addSubview(moneyView)
        moneyView.addSubview(payStack)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        resetBtn.translatesAutoresizingMaskIntoConstraints = false
        moneyView.translatesAutoresizingMaskIntoConstraints = false
        payStack.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            resetBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            resetBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moneyView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            moneyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moneyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moneyView.bottomAnchor.constraint(equalTo: resetBtn.topAnchor),
            payStack.centerYAnchor.constraint(equalTo: moneyView.centerYAnchor),
            payStack.trailingAnchor.constraint(equalTo: moneyView.trailingAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
        
        resetBtn.setTitle("초기화", for: .normal)
        resetBtn.setTitleColor(.red, for: .normal)
        resetBtn.titleLabel?.font = .systemFont(ofSize: 16)
        resetBtn.addTarget(self, action: #selector(resetBtnClicked(_:)), for: .touchUpInside)
        labelOne.text = "내 지갑:"
        labelTwo.text = "최종 결제금액"
        walletLabel.text = "\(walletMoney)원"
        payLabel.text = "\(payMoney)원"
        labelStack.axis = .vertical
        labelStack.alignment = .trailing
        labelStack.distribution = .fill
        labelStack.spacing = 15
        moneyStack.axis = .vertical
        moneyStack.alignment = .trailing
        moneyStack.distribution = .fill
        moneyStack.spacing = 15
        payStack.axis = .horizontal
        payStack.alignment = .trailing
        payStack.distribution = .fill
        payStack.spacing = 20
        
        tableView.dataSource = self
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: "foodCell")
        tableView.rowHeight = view.frame.width / 5
        tableView.isScrollEnabled = false
        
        numberFomatter.numberStyle = .decimal
        
        NotificationCenter.default.addObserver(self, selector: #selector(sumOfPrice), name: Notification.Name("foddCountChanged"), object: nil)
    }
    deinit{
        NotificationCenter.default.removeObserver(self)
    }

//MARK: - func
    @objc func chargeItemClicked(){
        let alertController = UIAlertController(title: "지갑", message: "얼마를 충전할까요?", preferredStyle: .alert)
        alertController.addTextField{(textField) in
            textField.placeholder = "금액을 입력하세요."
            textField.keyboardType = .numberPad
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: {action in
            if let chargeMoney = Int((alertController.textFields?.first?.text)!){
                self.walletMoney += chargeMoney
                self.walletLabel.text = "\(self.numberFomatter.string(for: self.walletMoney)!)원"
                print("\(chargeMoney)원 충전됨")
            }
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController,animated: true, completion: nil)
    }
    
    @objc func paymentItemClicked(){
        if shareData.st.foodCount.reduce(0, +) == 0{
            let alertController = UIAlertController(title: "상품 없음", message: "먼저 상품을 추가하세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
        else if payMoney > walletMoney{
            let alertController = UIAlertController(title: "잔액 부족", message: "\(payMoney - walletMoney)원이 모자랍니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
        else{
            let alertController = UIAlertController(title: "결제", message: "총\(numberFomatter.string(for: payMoney)!)원을 결제 하시겠습니까?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: {_ in
                self.walletMoney -= self.payMoney
                self.payMoney = 0
                self.walletLabel.text = "\(self.numberFomatter.string(for: self.walletMoney)!)원"
                self.payLabel.text = "0원"
                for idx in 0..<shareData.st.foodCount.count{
                    shareData.st.foodCount[idx] = 0
                }
                self.resetValue = !self.resetValue
                self.tableView.reloadData()
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
    @objc func sumOfPrice(_ sender: Notification){
        self.payMoney = 0
        for idx in 0..<priceArr.count {
            self.payMoney += priceArr[idx]*shareData.st.foodCount[idx]
        }
        payLabel.text = "\(numberFomatter.string(for: self.payMoney)!)원"
    }
    
    @objc func resetBtnClicked(_ sender: UIButton){
        self.walletMoney = 0
        self.payMoney = 0
        self.walletLabel.text = "0원"
        self.payLabel.text = "0원"
        for idx in 0..<shareData.st.foodCount.count{
            shareData.st.foodCount[idx] = 0
        }
        resetValue = !resetValue
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: FoodTableViewCell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as? FoodTableViewCell else{fatalError()}
        
        cell.selectionStyle = .none
        cell.selfIndex = indexPath.row
        cell.foodImageView.image = UIImage(named: imageArr[indexPath.row])
        cell.foodTitle.text = nameArr[indexPath.row]
        cell.foodSubtitle.text = "\(numberFomatter.string(for: priceArr[indexPath.row])!)원"
        
        if self.resetValue != cell.resetValue{
            cell.resetValue = self.resetValue
            cell.countStepper.value = 0
            cell.foodCount.text = "0개"
        }
        
        return cell
    }
}
