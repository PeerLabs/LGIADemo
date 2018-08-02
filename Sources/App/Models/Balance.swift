//
//  Balance.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//

import Foundation
import Vapor
import FluentSQLite

final class Balance: Codable {
	var id: UUID?
	var accountId: Account.ID
	var date: Date
	var description: String
	var value: Decimal
	var isProjected: Bool
	var notes: String?
	var createdAt: Date
	var updatedAt: Date

	init(accountId: Account.ID, description: String, date: Date, value: Decimal, isProjected: Bool?, notes: String?, createdAt: Date, updatedAt: Date) {
		self.accountId = accountId
		self.date = date
		self.description = description
		self.value = value
		self.notes = notes ?? ""
		self.isProjected = isProjected ?? false
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
}

extension Balance: SQLiteUUIDModel {}
extension Balance: Content {}
extension Balance: Parameter {}
extension Balance: Migration {
	//	static func prepare(on connection: SQLiteConnection) -> Future<Void> {
	//		return Database.create(self, on: connection) { builder in
	//			try addProperties(to: builder)
	//			builder.unique(on: \.name)
	//		}
	//	}
}
extension Balance {
	var account: Parent<Balance, Account> {
		return parent(\.accountId)
	}
}
