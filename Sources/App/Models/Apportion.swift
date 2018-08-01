//
//  Apportion.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//

import Foundation
import Vapor
import FluentSQLite

final class Apportion: Codable {
	var id: UUID?
	var accountId: Account.ID
	var description: String
	var percentage: Decimal
	var amount: Decimal
	var createdAt: Date
	var updatedAt: Date

	init(accountId: Account.ID, description: String, percentage: Decimal, amount: Decimal, createdAt: Date, updatedAt: Date) {
		self.accountId = accountId
		self.description = description
		self.percentage = percentage
		self.amount = amount
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
}

extension Apportion: SQLiteUUIDModel {}
extension Apportion: Content {}
extension Apportion: Parameter {}
extension Apportion: Migration {
	//	static func prepare(on connection: SQLiteConnection) -> Future<Void> {
	//		return Database.create(self, on: connection) { builder in
	//			try addProperties(to: builder)
	//			builder.unique(on: \.name)
	//		}
	//	}
}
extension Apportion {
	var account: Parent<Apportion, Account> {
		return parent(\.accountId)
	}
}
