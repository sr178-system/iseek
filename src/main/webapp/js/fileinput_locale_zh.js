/*!
 * FileInput Spanish (Latin American) Translations
 *
 * This file must be loaded after 'fileinput.js'. Patterns in braces '{}', or
 * any HTML markup tags in the messages must not be converted or translated.
 *
 * @see http://github.com/kartik-v/bootstrap-fileinput
 *
 * NOTE: this file must be saved in UTF-8 encoding.
 */
(function ($) {
    "use strict";
    $.fn.fileinput.locales.es = {
    		fileSingle: '单个文件',
            filePlural: '多个文件',
            browseLabel: '选择文件',
            removeLabel: '删除',
            removeTitle: '删除选中文件',
            cancelLabel: '取消',
            cancelTitle: '取消上传',
            uploadLabel: '上传',
            uploadTitle: '上传选中文件',
            msgSizeTooLarge: '文件 "{name}" (<b>{size} KB</b>) 超过最大允许上传大小为 <b>{maxSize} KB</b>. 请重新上传!',
            msgFilesTooLess: '文件数量必须大于 <b>{n}</b> {files} ，请重新上传！',
            msgFilesTooMany: '选择上传的文件数量 <b>({n})</b> 超过最大允许的极限 <b>{m}</b>. 请重试您的上传!',
            msgFileNotFound: '文件 "{name}" 未找到!',
            msgFileSecured: '安全限制防止读取文件 "{name}".',
            msgFileNotReadable: '文件 "{name}" 不是可读',
            msgFilePreviewAborted: '文件预览失败 "{name}".',
            msgFilePreviewError: '读取文件时发生一个错误 "{name}".',
            msgInvalidFileType: '无效的文件类型 "{name}". 只有 "{types}" 支持文件.',
            msgInvalidFileExtension: '不支持此文件格式， 请上传 "{extensions}" 格式文件',
            msgValidationError: '文件上传错误',
            msgLoading: '加载文件 {index} 的 {files} &hellip;',
            msgProgress: '加载文件 {index} 的 {files} - {name} - {percent}% 完成.',
            msgSelected: '选中{n}个文件',
            msgFoldersNotAllowed: 'Drag & drop files only! {n} folder(s) dropped were skipped.',
            dropZoneTitle: 'Drag & drop files here &hellip;'
    };

    $.extend($.fn.fileinput.defaults, $.fn.fileinput.locales.es);
})(window.jQuery);
