//
//  VerificationModel.swift
//  TestMail
//
//  Created by Алексей Шевченко on 09.02.2023.
//

import Foundation

class VerificationModel {
    private let mailsArray: [String] = ["@gmail.com", "@yandex.ru", "@yahoo.com", "@mail.ru"]
    
    public var nameMail: String = String()
    public var filtredMailArray: [String] = [String]()
    
    public func filtringMails(text: String) {
        var domainMail: String = String()
        filtredMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach( { mail in
            if mail.contains(domainMail) {
                if !filtredMailArray.contains(mail) {
                    filtredMailArray.append(mail)
                }
            }
        })
    }
    
    private func deriveNameMail(text: String) {
        guard let atSimbolIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: atSimbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        
        nameMail = String(range)
    }
    
    public func getFiltredMail(text: String) {
        filtringMails(text: text)
    }
    
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
