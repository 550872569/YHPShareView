//
//  ANShareConst.h
//  AudioNote
//
//  Created by 杨传华 on 2017/5/11.
//  Copyright © 2017年 YY. All rights reserved.
//

#ifndef ANShareConst_h
#define ANShareConst_h

#define kShareImageVCImageError  @"图片不存在或者内存不足"

#define kShareTextImageTitleTingxie                @"我用“知音听写”写了一篇个人创作，快来看看吧！"
#define kShareTextImageTitleSuibi                  @"我用“知音听写”写了一篇心情随笔，快来看看吧！"
#define kShareTextImageTitleCaifang                @"我用“知音听写”录了一篇访谈录音，快来看看吧！"

#define kShareDescriptionTingxie                   @"我用“知音听写”写了一篇个人创作，快来看看吧！"
#define kShareDescriptionSuibi                     @"我用“知音听写”写了一篇语音记事，快来看看吧！"
#define kShareDescriptionCaifang                   @"我用“知音听写”录了一篇访谈录音，快来看看吧！"
#define kShareDescriptionJishiXiezuo               @"我用“知音听写”写了一篇记事写作，快来看看吧！"
#define kShareTitleEmailOnly                       @"来自知音听写用户的分享"
#define TOAST_SHARE_FAIL_MSG_UN_SAVE                @"请保存文件后再发送"
#define TOAST_SHARE_FAIL_MSG_UN_COMPLETE_TRANSFER   @"请转写完成后再发送"
#define TOAST_SHARE_FAIL_MSG_UN_SYNC                @"请同步后再发送"
#define TOAST_SHARE_FAIL_MSG_LINKING                @"正在生成分享链接..."
#define TOAST_SHARE_FAIL_MSG_ERROR                  @"生成分享连接失败，请检查网络设置"

#define kShareToThirdTitle                         @"无法分享"
#define kShareToThirdMessage                       @"请检查是否登录，再进行分享！"
#define kShareToThirdEmailMessageBody              @"来自知音听写用户分享的文件"
#define kShareToThirdErrorTitle                    @"您没有需要分享的文本"

#define kShareImageTextForDebug  @"从前在北平读书的时候，老在城圈儿里呆着。四年中虽也游过三五回西山，却从没来过清华；说起清华，只觉得很远很远而已。那时也不认识清华人，有一回北大和清华学生在青年会举行英语辩论，我也去听。清华的英语确是流利得多，他们胜了。那回的题目和内容，已忘记干净；只记得复辩时，清华那位领袖很神气，引着孔子的什么话。北大答辩时，开头就用了fｕｒｉｏｕｓｌｙ一个字叙述这位领袖的态度。这个字也许太过，但也道着一点儿。那天清华学生是坐大汽车进城的，车便停在青年会前头；那时大汽车还很少。那是冬末春初，天很冷。一位清华学生在屋里只穿单大褂，将出门却套上厚厚的皮大氅。这种“行”和“衣”的路数，在当时却透着一股标劲儿。初来清华，在十四年夏天。刚从南方来北平，住在朝阳门边一个朋友家。那时教务长是张仲述先生，我们没见面。我写信给他，约定第三天上午去看他。写信时也和那位朋友商量过，十点赶得到清华么，从朝阳门哪儿？他那时已经来过一次，但似乎只记得“长林碧草”，"


typedef enum : NSUInteger {
    AN_SHARE_TYPE_SINA = 0,
    AN_SHARE_TYPE_QQ = 1,
    AN_SHARE_TYPE_WECHAT = 2,
    AN_SHARE_TYPE_EMAIL = 3,
    AN_SHARE_TYPE_WECHARZONE = 4,
    AN_SHARE_TYPE_CANCEL = 5,
} AN_SHARE_TYPE;


typedef enum : NSUInteger {
    SHAREMANAGER_SUCCESS = 10,
    SHAREMANAGER_ERROR_SINA_NOTEXIST = 11,
    SHAREMANAGER_ERROR_WECHAT_NOTEXIST = 12,
    SHAREMANAGER_ERROR_QQ_NOTEXIST = 13,
    SHAREMANAGER_ERROR_DATA_NOTEXIST = 14,
    SHAREMANAGER_ERROR_NOERROR = 0,
    SHAREMANAGER_ERROR_THIRDSDK = 1,
    SHAREMANAGER_ERROR_NET_NOTEXIST = 2,
    SHAREMANAGER_ERROR_SHARETYPE_ERROR = 3,
    SHAREMANAGER_ERROR_EMAIL_SETTING = 100,
    SHAREMANAGER_ERROR_EMAIL_NOTEXIST = 101,
    SHAREMANAGER_ERROR_NETWORK_FAIL = 102,
    
    AN_SHARE_RESULT_TYPE_EMAIL_SEND_SUCCESS = 200,
    AN_SHARE_RESULT_TYPE_EMAIL_SAVE_SUCCESS = 201,
    AN_SHARE_RESULT_TYPE_EMAIL_SEND_FAIL = 202,
    AN_SHARE_RESULT_TYPE_EMAIL_SEND_CANCEL = 203,
    
} AN_SHARE_RESULT_TYPE;

#define SHAREMANAGER_SUCCESS_MSG                    @"分享成功！"
#define SHAREMANAGER_ERROR_MSG_SINA_NOTEXIST        @"您未安装微博客户端！"
#define SHAREMANAGER_ERROR_MSG_WECHAT_NOTEXIST      @"您未安装微信客户端！"
#define SHAREMANAGER_ERROR_MSG_QQ_NOTEXIST          @"您未安装QQ客户端！"
#define SHAREMANAGER_ERROR_MSG_DATA_NOTEXIST        @"图片生成失败或内存不足"
#define SHAREMANAGER_ERROR_MSG_NOERROR              @"无错误"
#define SHAREMANAGER_ERROR_MSG_THIRDSDK             @"第三方SDK内部错误"
#define SHAREMANAGER_ERROR_MSG_NET_NOTEXIST         @"无网络连接"
#define SHAREMANAGER_ERROR_MSG_SHARETYPE_ERROR      @"用于分享的对象类型与Manager类型不符"
#define SHAREMANAGER_ERROR_MSG_EMAIL_NOTEXIST       @"您未安装Email客户端！"
#define SHAREMANAGER_ERROR_MSG_EMAIL_SETTINGERROR   @"请检查邮箱权限！"

#define AN_SHARE_RESULT_MSG_EMAIL_SEND_SUCCESS      @"邮件发送成功"
#define AN_SHARE_RESULT_MSG_EMAIL_SAVE_SUCCESS      @"邮件保存成功"
#define AN_SHARE_RESULT_MSG_EMAIL_SEND_FAIL         @"邮件发送失败"
#define AN_SHARE_RESULT_MSG_EMAIL_SEND_CANCEL       @"邮件发送取消"

#endif /* ANShareConst_h */
