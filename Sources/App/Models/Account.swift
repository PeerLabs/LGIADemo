//
//  Account.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//

import Foundation
import Vapor
import FluentSQLite

final class Account: Codable {
	var id: UUID?
	var name: String
	var createdAt: Date
	var updatedAt: Date

	init(name: String, createdAt: Date, updatedAt: Date) {
		self.name = name
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
}

extension Account: SQLiteUUIDModel {}
extension Account: Content {}
extension Account: Parameter {}
extension Account: Migration {
	//	static func prepare(on connection: SQLiteConnection) -> Future<Void> {
	//		return Database.create(self, on: connection) { builder in
	//			try addProperties(to: builder)
	//			builder.unique(on: \.name)
	//		}
	//	}
}
extension Account {
	var transactions: Children<Account, Transaction> {
		return children(\.accountId)
	}
	var balances: Children<Account, Balance> {
		return children(\.accountId)
	}
	var allocations: Children<Account, AssetAllocation> {
		return children(\.accountId)
	}
	var investmentStrategies: Children<Account, Apportion> {
		return children(\.accountId)
	}
}
