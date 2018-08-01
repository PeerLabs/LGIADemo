//
//  AssetAllocation.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//

import Foundation
import Vapor
import FluentSQLite

final class AssetAllocation: Codable {
	var id: UUID?
	var accountId: Account.ID
	var description: String
	var percentage: Decimal
	var createdAt: Date
	var updatedAt: Date

	init(accountId: Account.ID, description: String, percentage: Decimal, createdAt: Date, updatedAt: Date) {
		self.accountId = accountId
		self.description = description
		self.percentage = percentage
		self.createdAt = createdAt
		self.updatedAt = updatedAt
	}
}

extension AssetAllocation: SQLiteUUIDModel {}
extension AssetAllocation: Content {}
extension AssetAllocation: Parameter {}
extension AssetAllocation: Migration {
	//	static func prepare(on connection: SQLiteConnection) -> Future<Void> {
	//		return Database.create(self, on: connection) { builder in
	//			try addProperties(to: builder)
	//			builder.unique(on: \.name)
	//		}
	//	}
}
extension AssetAllocation {
	var account: Parent<AssetAllocation, Account> {
		return parent(\.accountId)
	}
}
