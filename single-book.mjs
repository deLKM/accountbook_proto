class Account {
  constructor() {
    // id都是字符串
    this.internalId = ""; // 不建议写入，内部id，在建账时按需要生成，例如+1，并且会被严格检验
    this.displayId = ""; // 可写入，外部账本id，用于呈现
    this.title = ""; // 可写入，账本标题
    this.subtitle = ""; // 可写入，账本副标题
    this.subOf = ""; // 可写入，账户的父账户，是一个内部id，可以留空
    this.deleted = false; // 可以写入，但注意参照完整性（要把它的关联日记账也删了）
  }
}
class Ebit {
  // 某个方向的发生额
  constructor() {
    this.account = ""; // 可写入，所在方向的账户，是内部id的引用
    this.amount = 0; // 可写入，交易金额, 不记录方向，应该为正数，以分为单位，以分为单位，以分为单位
    // 因为 0.3 === 0.1 + 0.2 为 false
  }
}
class Transaction {
  constructor() {
    // 一样
    this.internalId = ""; // 不建议写入，内部id，在记账时按需要生成，例如+1，并且会被严格检验
    this.displayId = ""; // 可写入，外部交易id，用于呈现
    this.timestamp = ""; // 可写入，交易时间，建议用ISO8601格式
    this.abstract = ""; // 可写入，交易摘要
    this.description = ""; // 可写入，交易描述
    // this.currency = ""; // 可写入，交易货币，建议用ISO4217格式，不想实现
    this.debit = []; // 可写入，是一个Ebit对象的数组
    this.credit = []; // 可写入，是一个Ebit对象的数组
    this.deleted = false; // 可写入，但注意参照完整性（要把它的关联调整记录也删（设置为delete）了）
    // 写入时检查借贷是否平衡，不平衡服务器返回错误
  }
}
class AccountHistory {
  constructor() {
    this.timestamp = ""; // 可写入，调整时间，建议用ISO8601格式
    this.account = ""; // 可写入，调整的账户，是内部id的引用
    this.action = ""; // 可写入，调整动作，"create"和"update"
    this.old = null; // 可写入，调整前的账户，是一个Account对象
  }
}
class TransactionHistory {
  constructor() {
    this.timestamp = ""; // 可写入，调整时间，建议用ISO8601格式
    this.transaction = ""; // 可写入，调整的交易，是内部id的引用
    this.action = ""; // 可写入，调整动作，"create"和"update"
    this.old = null; // 可写入，调整前的交易，是一个Transaction对象
  }
}
class SingleBook {
  constructor() {
    this.access = {
      read: [],
      write: [],
    }; // 不能在这里写入，这是一个记录表单，调用grantAccess api、revokeAccess api等（未实现）
    this.id = null; // 不可写入，并且会被严格检验
    this.owner = null; // 不可写入，调用changeOwner api（未实现）
    this.deleted = false; // 不可写入，调用deleteBook api（未实现）
    this.title = ""; // 可写入，账簿标题
    this.accounts = []; // 可写入，账簿里的所有账户，是Account对象的数组
    this.transactions = []; // 可写入，账簿里的所有交易（日记账），是Transaction对象的数组
    this.history = {
      accounts: [], // 可写入，账簿里的所有账户历史记录，是AccountHistory对象的数组
      transactions: [], // 可写入，账簿里的所有交易历史记录，是TransactionHistory对象的数组
    }; // 可写入，账簿里的所有调整记录
    this.keyAccount = {
      // 可写入，账簿里的关键账户（所谓的类型）
      asset: "",
      liability: "",
      equity: "",
      income: "",
      expense: "",
    }; // 内部id的引用
    // this.labelaccount = []; // 可写入，账簿里的所有账户标签，不想实现
    // this.labeltransaction = []; // 可写入，账簿里的所有交易标签，不想实现
  }
}
class MergeResult {
  constructor(success, message = [], data = null) {
    this.data = data;
    this.success = success; // 0是失败，1是成功，2是部分被跳过
    this.message = message;
  }
}
function mergeBook(data, newData) {
  // 合并账簿，这两个参数都是SingleBook对象（或者拥有一致结构的对象）
  var result = new SingleBook();
  var messages = [];
  if (!data || !newData) {
    return new MergeResult(0, ["数据不能为空"]);
  }
  if (data.deleted || newData.deleted) {
    return new MergeResult(0, ["账簿已删除"]);
  }
  if (data.id !== newData.id) {
    return new MergeResult(0, ["账簿id不一致"]);
  }
  result.id = data.id;
  if (data.owner !== newData.owner) {
    messages.push("账簿所有者不一致");
  }
  result.owner = data.owner;
  if (data.access) {
    result.access = JSON.parse(JSON.stringify(data.access));
  } else {
    return new MergeResult(0, ["访问权限数据不能为空"]);
  }
  result.access.write = data.access.write;
  result.title = data.title || newData.title;
  var newAccounts = [];
  if (data.accounts) {
    data.accounts.forEach((account) => {
      var newAccount = new Account();
      Object.assign(newAccount, account);
      newAccounts.push(newAccount);
    });
  }
  if (newData.accounts) {
    newData.accounts.forEach((account) => {
      var newAccount = new Account();
      Object.assign(newAccount, account);
      var oldAccount = newAccounts.find(
        (a) => a.internalId === newAccount.internalId
      );
      if (oldAccount) {
        Object.assign(oldAccount, newAccount);
      } else {
        newAccounts.push(newAccount);
      }
    });
  }
  result.accounts = newAccounts;
  // 不想做了，没写完，交易还没合并
  return new MergeResult(1, messages, result);
}
// 传输时直接对SingleBook对象进行JSON.stringify，接收时直接对JSON.parse后的对象进行mergeBook
export default mergeBook;
