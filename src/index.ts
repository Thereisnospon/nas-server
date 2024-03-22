import * as lark from '@larksuiteoapi/node-sdk';
import Koa = require('koa');
import Router from '@koa/router';
import koaBody from 'koa-body';
import bodyParser from 'koa-bodyparser';

const server = new Koa();
const app = new Koa();
const router = new Router();
server.use(koaBody());

app.use(koaBody());
app.use(bodyParser());

server.use(router.routes());
class Response {
    constructor(
        public code: number,
        public data: any,
        public err_msg: string | null
    ) {}
}
router.get('/', async (ctx, next) => {
    const queryParam = ctx.query.exampleParam;
    const headers = ctx.headers;
    const body=new Response(0, { message: 'GET', paramReceived: queryParam,headers:headers }, null);
    ctx.body = body
    console.log(body)
});
router.post('/', async (ctx, next) => {
    const queryParam = ctx.query.exampleParam;
    const headers = ctx.headers;
    const body=new Response(0, { message: 'POST', paramReceived: queryParam,"request_body":ctx.body,headers:headers }, null);
    ctx.body = body
    console.log(body)
});


app.use(router.routes());
console.log("access http://127.0.0.1:9000")
app.listen(9000);
