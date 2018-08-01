//
//  DefaultData.swift
//  App
//
//  Created by Abrar Peer on 1/8/18.
//
import Foundation
import Vapor
import FluentSQLite

struct DefaultData: Migration {

	typealias Database = SQLiteDatabase

	static var dateFormatter : DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM/yyyy"
		return formatter
	}

	static func saveDefaultTransactions(accountId: UUID, conn: SQLiteConnection) -> EventLoopFuture<Void> {

		var txns = [Transaction]()

		//	15/10/2017	STARTING AMOUNT	631087.00	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "15/10/2017")!, description: "STARTING AMOUNT", amount: 631087.00, createdAt: Date(), updatedAt: Date()))

		//	1/11/2017	Employer Contribution	2439.00	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/11/2017")!, description: "Employer Contribution", amount: 2439.00, createdAt: Date(), updatedAt: Date()))

		//	1/11/2017	Subscription Fee	34.21	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/11/2017")!, description: "Subscription Fee", amount: -34.21, createdAt: Date(), updatedAt: Date()))

		//	1/11/2017	Other Fee	13.97	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/11/2017")!, description: "Other Fee", amount: -13.97, createdAt: Date(), updatedAt: Date()))

		//	1/12/2017	Employer Contribution	2439.00	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/12/2017")!, description: "Employer Contribution", amount: 2439.00, createdAt: Date(), updatedAt: Date()))

		//	1/12/2017	Subscription Fee	34.21	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/12/2017")!, description: "Subscription Fee", amount: -34.21, createdAt: Date(), updatedAt: Date()))

		//	1/12/2017	Other Fee	13.97	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/12/2017")!, description: "Other Fee", amount:-13.97, createdAt: Date(), updatedAt: Date()))

		//	1/01/2018	Employer Contribution	2439.00	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/01/2018")!, description: "Employer Contribution", amount: 2439.00, createdAt: Date(), updatedAt: Date()))

		//	1/01/2018	Subscription Fee	34.21	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/01/2018")!, description: "Subscription Fee", amount: -34.21, createdAt: Date(), updatedAt: Date()))

		//	1/01/2018	Other Fee	13.97	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/01/2018")!, description: "Other Fee", amount: -13.97, createdAt: Date(), updatedAt: Date()))

		//	1/02/2018	Employer Contribution	2439.00	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/02/2018")!, description: "Employer Contribution", amount: 2439.00, createdAt: Date(), updatedAt: Date()))

		//	1/02/2018	Subscription Fee	34.21	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/02/2018")!, description: "Subscription Fee", amount: -34.21, createdAt: Date(), updatedAt: Date()))

		//	1/02/2018	Other Fee	13.97	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/02/2018")!, description: "Other Fee", amount: -13.97, createdAt: Date(), updatedAt: Date()))

		//	1/03/2018	Employer Contribution	2439.00	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/03/2018")!, description: "Employer Contribution", amount: 2439.00, createdAt: Date(), updatedAt: Date()))

		//	1/03/2018	Subscription Fee	34.21	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/03/2018")!, description: "Subscription Fee", amount: -34.21, createdAt: Date(), updatedAt: Date()))

		//	1/03/2018	Other Fee	13.97	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/03/2018")!, description: "Other Fee", amount: -13.97, createdAt: Date(), updatedAt: Date()))

		//	1/04/2018	Paid out as Income	5100.00	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/04/2018")!, description: "Paid out as Income", amount: -5100.00, createdAt: Date(), updatedAt: Date()))

		//	1/05/2018	Paid out as Income	5100.00	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/05/2018")!, description: "Paid out as Income", amount: -5100.00, createdAt: Date(), updatedAt: Date()))

		//	1/06/2018	Paid out as Income	5100.00	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/06/2018")!, description: "Paid out as Income", amount: -5100.00, createdAt: Date(), updatedAt: Date()))

		//	1/07/2018	Paid out as Income	5100.00	D
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "1/07/2018")!, description: "Paid out as Income", amount: -5100.00, createdAt: Date(), updatedAt: Date()))

		//	15/07/2018	BALANCE	622641.10	C
		txns.append(Transaction(accountId: accountId, date: DefaultData.dateFormatter.date(from: "15/07/2018")!, description: "Balance", amount: 622641.10, createdAt: Date(), updatedAt: Date()))

		for txn in txns {
			let _  = txn.save(on: conn)
		}

		return .done(on: conn)

	}

	static func saveDefaultBalances(accountId: UUID, conn: SQLiteConnection) -> EventLoopFuture<Void> {

		var balances = [Balance]()

		// 30/6/2013	YTD Balance	494522	C
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2013")!, value: 494522, notes: nil, createdAt: Date(), updatedAt: Date()))

		// 30/6/2014	YTD Balance	521083	C
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2014")!, value: 521083, notes: nil, createdAt: Date(), updatedAt: Date()))

		// 30/6/2015	YTD Balance	538742	C
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2015")!, value: 538742, notes: nil, createdAt: Date(), updatedAt: Date()))

		// 30/6/2016	YTD Balance	587324	C
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2016")!, value: 587324, notes: nil, createdAt: Date(), updatedAt: Date()))

		// 30/6/2017	YTD Balance	601234	C
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2017")!, value: 601234, notes: nil, createdAt: Date(), updatedAt: Date()))

		// 30/6/2018	YTD Balance	622641	C
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2018")!, value: 622641, notes: nil, createdAt: Date(), updatedAt: Date()))

		// 30/6/2019	YTD Balance	653887	C	Projected
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2019")!, value: 653887, notes: "projected", createdAt: Date(), updatedAt: Date()))

		// 30/6/2020	YTD Balance	680447	C	Projected
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2020")!, value: 680447, notes: "projected", createdAt: Date(), updatedAt: Date()))

		// 30/6/2021	YTD Balance	707008	C	Projected
		balances.append(Balance(accountId: accountId, description: "YTD Balance", date: DefaultData.dateFormatter.date(from: "30/6/2021")!, value: 707008, notes: "projected", createdAt: Date(), updatedAt: Date()))

		for bal in balances {
			let _ = bal.save(on: conn)
		}

		return .done(on: conn)

	}

	static func saveDefaultAssetAllocations(accountId: UUID, conn: SQLiteConnection) -> EventLoopFuture<Void> {

		var assetAllocations = [AssetAllocation]()

		// International Shares	44%
		assetAllocations.append(AssetAllocation(accountId: accountId, description: "International Shares", percentage: 0.44, createdAt: Date(), updatedAt: Date()))

		// Australian Shares	29%
		assetAllocations.append(AssetAllocation(accountId: accountId, description: "Australian Shares", percentage: 0.29, createdAt: Date(), updatedAt: Date()))

		// Property	15%
		assetAllocations.append(AssetAllocation(accountId: accountId, description: "Property", percentage: 0.15, createdAt: Date(), updatedAt: Date()))

		// Alternatives	12%
		assetAllocations.append(AssetAllocation(accountId: accountId, description: "Alternatives", percentage: 0.12, createdAt: Date(), updatedAt: Date()))

		for alloc in assetAllocations {
			let _ = alloc.save(on: conn)
		}

		return .done(on: conn)

	}

	static func saveDefaultInvestmentStrategies(accountId: UUID, conn: SQLiteConnection) -> EventLoopFuture<Void> {

		var invStrategies = [Apportion]()

		//			MySuper Lifecycle Under 75	20%	145080
		invStrategies.append(Apportion(accountId: accountId, description: "MySuper Lifecycle Under 75", percentage: 0.2, amount: 145080, createdAt: Date(), updatedAt: Date()))

		//			Diversified Fixed Interest	8%	118032
		invStrategies.append(Apportion(accountId: accountId, description: "Diversified Fixed Interest", percentage: 0.08, amount: 118032, createdAt: Date(), updatedAt: Date()))

		//			Balanced	12%	127048
		invStrategies.append(Apportion(accountId: accountId, description: "Balanced", percentage: 0.12, amount: 127048, createdAt: Date(), updatedAt: Date()))

		//			Aggressive	60%	255240
		invStrategies.append(Apportion(accountId: accountId, description: "Aggressive", percentage: 0.6, amount: 255240, createdAt: Date(), updatedAt: Date()))

		for strategy in invStrategies {
			let _ = strategy.save(on: conn)
		}

		return .done(on: conn)

	}

	static func prepare(on conn: SQLiteConnection) -> EventLoopFuture<Void> {

		let defaultAccount = Account(name: "Test Account", createdAt: Date(), updatedAt: Date())

		return defaultAccount.save(on: conn).then({ savedAccount in

			return DefaultData.saveDefaultTransactions(accountId: savedAccount.id!, conn: conn).then({

				return DefaultData.saveDefaultBalances(accountId: savedAccount.id!, conn: conn).then({

					return DefaultData.saveDefaultAssetAllocations(accountId: savedAccount.id!, conn: conn).then({

						return DefaultData.saveDefaultInvestmentStrategies(accountId: savedAccount.id!, conn: conn)

					})

				})

			})

		})
	}

	static func revert(on conn: SQLiteConnection) -> EventLoopFuture<Void> {
		return .done(on: conn)
	}

}
