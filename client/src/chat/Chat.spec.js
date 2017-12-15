import ChatModule from './Chat';
import ReactDOM from 'react-dom';
import React from 'react';
import { shallow } from 'enzyme';

import MessageRouter from '../common/framework/message-router';

describe("Chat UI component tests", function () {

	let div, component;

	let Chat;

	let queryRouter = MessageRouter(inject({}));
    let commandRouter = MessageRouter(inject({}));
    let eventRouter = MessageRouter(inject({}));
    let commandsReceived=[];

    commandRouter.on("*", function(cmd){
        commandsReceived.push(cmd);
    } );

    beforeEach(function () {
        commandsReceived.length=0;
        Chat = ChatModule(inject({
            generateUUID:()=>{
                return "youyouid"
            },
            commandPort: commandRouter,
            eventRouter,
            queryRouter
        }));

        component = shallow(<Chat />, div);
    });

    it('should render without error', function(){
    	expect(shallow(<Chat />).length).toEqual(1);
    });
});
