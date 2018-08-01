//
//  Transaction.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//

import Foundation
import Vapor
import FluentSQLite

final class Transaction: Codable {
	var id: UUID?
	var accountId: Account.ID
	var date: Date
	var description: String
	var amount: Decimal
	var createdAt: Date
	var updatedAt: Date

	init(accountId: Account.ID, date: Date, description: String, amount: Decimal, createdAt: Date, updatedAt: Date) {
		self.accountId = accountId
		self.date = date
		self.description = description
		self.amount = amount
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
}

extension Transaction: SQLiteUUIDModel {}
extension Transaction: Content {}
extension Transaction: Parameter {}
extension Transaction: Migration {
//	static func prepare(on connection: SQLiteConnection) -> Future<Void> {
//		return Database.create(self, on: connection) { builder in
//			try addProperties(to: builder)
//			builder.unique(on: \.name)
//		}
//	}
}
extension Transaction {
	var account: Parent<Transaction, Account> {
		return parent(\.accountId)
	}
}
