//
//  SystemImage.swift
//  PTV
//
//  Created by Wael Saad on 23/5/2022.
//

import Foundation

enum SystemImage: String {
    case card = "creditcard"                                    // 􀍯
    case circle = "circle"                                      // 􀀀
    case circleFill = "circle.fill"                             // 􀀁
    case house = "house"                                        // 􀎞
    case houseFill = "house.fill"                               // 􀎟
    case exclamationCircle = "exclamationmark.circle"           // 􀁞
    case exclamationCircleFill = "exclamationmark.circle.fill"  // 􀁟
    case exclamationTriangle = "exclamationmark.triangle"       // 􀇾
    case paperclip = "paperclip"                                // 􀉢
    case questionCircle = "questionmark.circle"                 // 􀁜
    case plus = "plus"                                          // 􀅼
    case plusCircleFill = "plus.circle.fill"                    // 􀁍
    case qrCode = "qrcode"                                      // 􀖂
    case qrCodeScanner = "qrcode.viewfinder"                    // 􀎻
    case settingsCog = "gearshape"                              // 􀣋
    case xMark = "xmark"                                        // 􀆄
    case infoFill = "info.circle.fill"                          // 􀅵
    case infoCircle = "info.circle"                             // 􀅴
    case wallet = "wallet.pass"                                 // 􀟾
    case walletFill = "wallet.pass.fill"                        // 􀟿
    case pencil = "pencil"                                      // 􀈊
    case ellipsis = "ellipsis.circle"                           // 􀍡
    case doc = "doc"                                            // 􀈷
    case docWithWords = "doc.text"                              // 􀈿
    case docWithTopText = "doc.plaintext"                       // 􀉆
    case listWithBullets = "list.bullet"                        // 􀋲
    case shieldExclaimation = "exclamationmark.shield"          // 􀞟
    case share = "square.and.arrow.up"                          // 􀈂
    case tickCircleFill = "checkmark.circle.fill"               // 􀁣
    case tickCircle = "checkmark.circle"                        // 􀁢
    case star = "star"                                          // 􀋂
    case starSlash = "star.slash"                               // 􀋇
    case scan = "doc.viewfinder"                                // 􀎾
    case notifications = "bell.badge"                           // 􀝖
    case bell = "bell"                                          // 􀋙
    case key = "key"                                            // 􀟕
    case keyFill = "key.fill"                                   // 􀟖
    case feedback = "exclamationmark.bubble"                    // 􀌬
    case squareWithCheckmark = "checkmark.square.fill"          // 􀃳
    case square = "square"                                      // 􀂒
    case iPhone = "iphone"                                      // 􀟜
    case link = "link"                                          // 􀉣
    case grid = "rectangle.grid.2x2"                            // 􀛦
    case building2Fill = "building.2.fill"                      // 􀝓

    // people things
    case account = "person.crop.circle"                         // 􀉭
    case personSquare = "person.crop.square"                    // 􀉹
    case personCircleFill = "person.circle.fill"                // 􀓤
    case personCircle = "person.circle"                         // 􀓣
    case person = "person"                                      // 􀉩
    
    case faceId = "faceid"                                      // 􀎽
    case touchId = "touchid"                                    // 􀟒

    // things that point in various directions
    case rightArrow = "arrow.right"                             // 􀄫
    case leftChevron = "chevron.left"                           // 􀆉
    case rightChevron = "chevron.right"                         // 􀆊
    case rightArrowSquareFill = "arrow.right.square.fill"       // 􀄍
    case rightArrowSquare = "arrow.right.square"                // 􀄌
    case deleteLeft = "delete.left"                             // 􀆛
    case deleteLeftFill = "delete.left.fill"                    // 􀆜
    case download = "square.and.arrow.down"                     // 􀈄
    case refresh = "arrow.clockwise"                            // 􀅈
    case arrowUpRightSquare = "arrow.up.right.square"           // 􀄔
    
    // inbox
    case envelope = "envelope"                                  // 􀍕
    case envelopeFill = "envelope.fill"                         // 􀍖
    case envelopeBadge = "envelope.badge"                       // 􀍛
    case envelopeOpen = "envelope.open"                         // 􀍙
    case inboxFolderAdd = "folder.badge.plus"                   // 􀈙
    case inboxFolderMain = "tray"                               // 􀈣
    case inboxFolderCustom = "folder"                           // 􀈕
    case inboxFolderTrash = "trash"                             // 􀈑

}
