//
//  ContentView.swift
//  toshiba
//
//  Created by Anonymous on 02/07/2022.
//

import SwiftUI
import Alamofire

/*
 curl -v \
     -X POST \
     -H "Accept-Language: fr-US;q=1.0" \
     -H "User-Agent: toshiba/1.0 (com.test.toshiba; build:1; iOS 15.5.0) Alamofire/5.6.1" \
     -H "Accept-Encoding: br;q=1.0, gzip;q=0.9, deflate;q=0.8" \
     -H "Connection: keep-alive" \
     -H "Content-Type: application/json" \
     -H "Authorization: Basic OjAwMDA=" \
     -d "{\"id\":1,\"version\":\"1.0\",\"params\":[{\"clientid\":\"client_id\",\"level\":\"private\",\"nickname\":\"Remote test\"},[{\"function\":\"WOL\",\"value\":\"yes\"}]],\"method\":\"actRegister\"}" \
     "http://192.168.1.20/sony/accessControl"
*/
struct ContentView: View {
    func test() {
        let str_url = "http://192.168.1.20/sony/accessControl"
        let targetObj = ["value": "yes", "function": "WOL"]
        let array = [targetObj]
        let params = ["clientid": "client_id", "nickname": "Remote test", "level": "private"]
        let array1 = [params, array] as [Any]
        
        let parameters: Parameters = ["method": "actRegister",
                      "params": array1,
                      "id": 1,
                      "version": "1.0"]

        let headers: HTTPHeaders = [
            "Connection": "keep-alive",
            "Authorization": "Basic OjAwMDA=",
            ]
        
        AF.request(str_url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .cURLDescription { description in
                print(description)
            }
            .response { response in
                debugPrint(response)
            }
    }
    
    var body: some View {
        Button {test()}
        label: {Image(systemName: "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
